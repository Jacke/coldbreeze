package models.DAO.conversion


import main.scala.bprocesses.refs._
import main.scala.bprocesses._
import models.DAO._
import models.DAO.reflect._
import main.scala.bprocesses.refs.UnitRefs._
import main.scala.simple_parts.process.Units._
/**
 * Default states for
 * Process elements
 **/
object AutoTracer {
  


  def defaultStatesForRefElem(ref_id: Int, front_elem_id:Option[Int], space_elem_id:Option[Int]):List[BPStateRef] = {
		val states = List(BPStateRef(
		  None, 
		  reflection = ref_id,
		  title = "initiated", 
		  opposite = "uninitiated",
		  process_state = false,
		  on = false,
		  on_rate = 0,
		  front_elem_id = front_elem_id,
		  space_elem_id = space_elem_id,
		  space_id = None,
		  created_at = Some(org.joda.time.DateTime.now), 
		  updated_at = Some(org.joda.time.DateTime.now)),
		BPStateRef(
		  None, 
		  reflection = ref_id,
		  title = "invoked", 
		  opposite = "uninvoked",
		  process_state = false,
		  on = false,
		  on_rate = 0,
		  front_elem_id = front_elem_id,
		  space_elem_id = space_elem_id,
		  space_id = None,
		  created_at = Some(org.joda.time.DateTime.now), 
		  updated_at = Some(org.joda.time.DateTime.now)),
		BPStateRef(
		  None, 
		  reflection = ref_id,
		  title = "completed", 
		  opposite = "uncompleted",
		  process_state = false,
		  on = false,
		  on_rate = 0,
		  front_elem_id = front_elem_id,
		  space_elem_id = space_elem_id,
		  space_id = None,
		  created_at = Some(org.joda.time.DateTime.now), 
		  updated_at = Some(org.joda.time.DateTime.now))
		)
  val state_ids = BPStateRefDAO.findOrCreateForElem(states, front_elem_id = front_elem_id, space_elem_id = space_elem_id)
  val created_states = states.zip(state_ids).map(st => st._1.copy(id = Some(st._2)))
  // Default switchers
  // next for completed
  created_states.filter(st => st.title == "completed").map(st => SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
																	reflection = ref_id,
																	switch_type = "n", 
																	priority = 2,                            
																	state_ref = st.id.get,
																	fn = "inc",
																	target = "step",
																	created_at = Some(org.joda.time.DateTime.now),
																	updated_at = Some(org.joda.time.DateTime.now))))
  created_states
  }

  def defaultStatesForSpace(ref_id: Int, space_id:Option[Int]):List[BPStateRef] = {
		val states = List(BPStateRef(
									  None, 
									  reflection = ref_id,
									  title = "finished", 
									  opposite = "unfinished",
									  process_state = false,
									  on = false,
									  on_rate = 0,
									  front_elem_id = None,
									  space_elem_id = None,
									  space_id = space_id,
									  created_at = Some(org.joda.time.DateTime.now), 
									  updated_at = Some(org.joda.time.DateTime.now)))
	    val state_ids = BPStateRefDAO.findOrCreateForSpace(states, space_id.getOrElse(-1))
		val created_states = states.zip(state_ids).map(st => st._1.copy(id = Some(st._2)))
		// Default switchers
		// space out for finished
		created_states.filter(st => st.title == "finished").map(st => SwitcherRefDAO.pull_object(UnitSwitcherRef(None,
																reflection = ref_id,
																switch_type = "out", 
																priority = 2,                            
																state_ref = st.id.get,
																fn = "dec",
																target = "space_index",
																created_at = Some(org.joda.time.DateTime.now),
																updated_at = Some(org.joda.time.DateTime.now))))
		created_states
  }


  def defaultStatesForProcess(process_id: Int):List[BPState] = {
		val states = List(
		BPState(
				  None, 
				  process = process_id,
				  title = "initiated", 
				  opposite  = "uninitiated",
				  process_state = true,
				  on = false,
				  on_rate = 0,
				  front_elem_id = None,
				  space_elem_id = None,
				  space_id = None,
				  created_at = Some(org.joda.time.DateTime.now), 
				  updated_at = Some(org.joda.time.DateTime.now)),
		BPState(
				  None, 
				  process = process_id,
				  title = "invoking", 
				  opposite  = "paused",
				  process_state = true,
				  on = false,
				  on_rate = 0,
				  front_elem_id = None,
				  space_elem_id = None,
				  space_id = None,
				  created_at = Some(org.joda.time.DateTime.now), 
				  updated_at = Some(org.joda.time.DateTime.now)),
		BPState(
				  None, 
				  process = process_id,
				  title = "finished", 
				  opposite  = "unfinished",
				  process_state = true,
				  on = false,
				  on_rate = 0,
				  front_elem_id = None,
				  space_elem_id = None,
				  space_id = None,
				  created_at = Some(org.joda.time.DateTime.now), 
				  updated_at = Some(org.joda.time.DateTime.now)))

		val state_ids = BPStateDAO.findOrCreateForProcess(states, process_id)
		states.zip(state_ids).map(st => st._1.copy(id = Some(st._2)))
  }

}