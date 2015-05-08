package cloner.util

import models.DAO._
import models.DAO.reflect._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.Units._
import main.scala.bprocesses._

object ProcessCloner {
	def clone(bpId: Int, orig_title: String):Int = {
	var title = orig_title
    if (BPDAO.checkTitle(orig_title).isDefined) {
      title = orig_title + " Copy"
    } 
    BPDAO.get(bpId) match {
      case Some(bprocess) => {
        val newBpId = BPDAO.pull_object(bprocess.copy(id = None, title = title))
        val spaces = BPSpaceDAO.findByBPId(bpId)
        val space_elems = SpaceElemDAO.findByBPId(bpId)
        val proc_elems = ProcElemDAO.findByBPId(bpId)
        val states = BPStateDAO.findByBP(bpId)
        val topologs = ElemTopologDAO.findByBP(bpId)
        val switchers = SwitcherDAO.findByBPId(bpId)
        val reactions = ReactionDAO.findByBP(bpId)
        val reaction_outs = ReactionStateOutDAO.findByReactions(reactions.flatMap(_.id))


        var new_proc_elems_ids = scala.collection.mutable.Map.empty[Int, Int]
        val new_proc_elems = proc_elems.foreach { proc_element =>
          oldNewIdMap(proc_element.id.get,
                      ProcElemDAO.pull_object(
                                  UndefElement(None,
                                              proc_element.title,
                                              proc_element.desc,
                                              proc_element.business,
                                              newBpId,
                                              proc_element.b_type,
                                              proc_element.type_title,
                                              proc_element.space_own,
                                              proc_element.order,
                                              proc_element.comps)), 
                      new_proc_elems_ids) 
        }
        var new_space_elems_ids = scala.collection.mutable.Map.empty[Int, Int]
        val new_space_elems = space_elems.foreach { space_element => 
          oldNewIdMap(space_element.id.get, 
                      SpaceElemDAO.pull_object(
                            SpaceElementDTO(None,
                                            space_element.title,
                                            space_element.desc,
                                            space_element.business,
                                            newBpId,
                                            space_element.b_type,
                                            space_element.type_title,
                                            space_element.space_own,
                                            space_element.space_owned,
                                            space_element.space_role,
                                            space_element.order,
                                            space_element.comps)),
                      new_space_elems_ids)

        }
        var new_spaces_ids = scala.collection.mutable.Map.empty[Int, Int]
        val nes_spaces = spaces.foreach { space => 
          oldNewIdMap(space.id.get,
                      BPSpaceDAO.pull_object(BPSpaceDTO(None, 
                                                        newBpId, 
                                                        space.index, 
                                                        space.container, 
                                                        space.subbrick, 
                                                        new_proc_elems_ids.get(space.brick_front.getOrElse(0)),
                                                        new_space_elems_ids.get(space.brick_nested.getOrElse(0)), 
                                                        space.nestingLevel)),
                      new_spaces_ids) 

        }
        // Update space_elem spaces
        println("new space elem ids" + new_space_elems_ids.values.toList)
        SpaceElemDAO.findByIds(new_space_elems_ids.values.toList).foreach { new_space_elem =>
          SpaceElemDAO.update(new_space_elem.id.get, new_space_elem.copy(space_owned = new_spaces_ids.get(new_space_elem.space_owned).get, 
                                                                         space_own = getSpaceOwn(new_space_elem.space_own, new_spaces_ids) ))

        }


        var new_states_ids = scala.collection.mutable.Map.empty[Int, Int]
        states.foreach { state =>
            oldNewIdMap(state.id.get,
             BPStateDAO.pull_object(BPState(
                      None, 
                      process = newBpId,
                      state.title, 
                      state.neutral,
                      state.process_state,
                      state.on,
                      state.on_rate,
                      front_elem_id = new_proc_elems_ids.get(state.front_elem_id.getOrElse(0)),
                      space_elem_id = new_space_elems_ids.get(state.space_elem_id.getOrElse(0)),
                      space_id = new_spaces_ids.get(state.space_id.getOrElse(0)),
                      created_at = Some(org.joda.time.DateTime.now()), 
                      updated_at = Some(org.joda.time.DateTime.now()), 
                      state.lang,
                      state.middle,
                      state.middleable,
                      state.oposite,
                      state.opositable
                    )),
            new_states_ids)
        }
        var new_topologs_ids = scala.collection.mutable.Map.empty[Int, Int]
        topologs.foreach { topolog =>
            oldNewIdMap(topolog.id.get,
             ElemTopologDAO.pull_object(ElemTopology(None, 
                          process = newBpId, 
                          front_elem_id = new_proc_elems_ids.get(topolog.front_elem_id.getOrElse(0)), 
                          space_elem_id = new_space_elems_ids.get(topolog.space_elem_id.getOrElse(0)), 
                          topolog.hash, 
                          created_at = Some(org.joda.time.DateTime.now),
                          updated_at = Some(org.joda.time.DateTime.now),
                          space_id = new_spaces_ids.get(topolog.space_id.getOrElse(0))
                          )),
             new_topologs_ids)
        }
        var new_switchers_ids = scala.collection.mutable.Map.empty[Int, Int]
        switchers.foreach { switcher =>
            oldNewIdMap(switcher.id.get,
             SwitcherDAO.pull_object(UnitSwitcher(None,
                          bprocess = newBpId,
                          switcher.switch_type, 
                          switcher.priority,                            
                          state_ref = new_states_ids.get(switcher.state_ref).get,
                          session_state_ref = None, // Session state ref is ref to runtime state, so it's useless in process clone                           
                          switcher.fn,
                          switcher.target,
                          switcher.override_group,
                          created_at = Some(org.joda.time.DateTime.now),
                          updated_at = Some(org.joda.time.DateTime.now))),
             new_switchers_ids)
        }
        var new_reactions_ids = scala.collection.mutable.Map.empty[Int, Int]
        reactions.foreach { reaction =>
            oldNewIdMap(reaction.id.get,
            ReactionDAO.pull_object(UnitReaction(None,
                          bprocess = newBpId,
                          reaction.autostart,
                          title = reaction.title, 
                          element = new_topologs_ids.get(reaction.element).get,
                          from_state = new_states_ids.get(reaction.from_state.get),                            
                          created_at = Some(org.joda.time.DateTime.now),
                          updated_at = Some(org.joda.time.DateTime.now))),
             new_reactions_ids)
        }
        var new_reaction_outs_ids = scala.collection.mutable.Map.empty[Int, Int]
        reaction_outs.foreach { reaction_out =>
            oldNewIdMap(reaction_out.id.get,
             ReactionStateOutDAO.pull_object(UnitReactionStateOut(None,
                                  state_ref = new_states_ids.get(reaction_out.state_ref).get,
                                  reaction = new_reactions_ids.get(reaction_out.reaction).get,
                                  reaction_out.on,
                                  reaction_out.on_rate,
                                  created_at = Some(org.joda.time.DateTime.now),
                                  updated_at = Some(org.joda.time.DateTime.now))),
             new_reaction_outs_ids)
        }


        newBpId
 
      }
      case _ => -1
    }
  	
	}

  /**
   * Maping betwen old ids and new one
   */
  def oldNewIdMap(old_id: Int, new_id: Int, container: scala.collection.mutable.Map[Int,Int]) = {
    container += ((old_id, new_id))
  }
  private def getSpaceOwn(z: Option[Int], container: scala.collection.mutable.Map[Int, Int]) = {
     z match {
      case Some(owned_id) => container.get(owned_id)
      case _ => None
     }
  }
  def expandOptionInt(value: Option[Int], container: scala.collection.mutable.Map[Int, Int]):Option[Int] = {
    value match {
      case Some(existed) => container.get(existed)
      case _ => None
    }
  }

}