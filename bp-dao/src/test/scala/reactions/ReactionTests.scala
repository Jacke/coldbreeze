package dao.test




import org.specs2.mutable._

import main.scala.bprocesses._
import main.scala.simple_parts.process._
import main.scala.simple_parts.process.control._
import main.scala.simple_parts.process.data._
import main.scala.utils._
import main.scala.resources.scopes._
import us.ority.min.actions._
import main.scala.simple_parts.process._

import main.scala.bprocesses.links._
import models.DAO.reflect._
import main.scala.bprocesses.refs._
import main.scala.bprocesses.refs._

import com.typesafe.scalalogging.Logger
import org.slf4j.LoggerFactory


class ActionSpec extends Specification {

    var instance:Option[BProcess] = None

    def prepare_process:BProcess = {
          val proc2 = new BProcess(new Managment)
          proc2.push {
            Array[ProcElems](
              //new Note("Test note"),
              //new Constant[Int](1001),
              //new Constant[Int](1001),
              new Constant[Boolean](1, true,proc2, 1),
              new Constant[Boolean](2, true,proc2, 1),
              new Constant[Boolean](3, false,proc2, 1),
              new ContainerBrick(4, "container brick", "", Option(CompositeValues()), proc2, "brick", "containerbrick", 4),
              new ExpandBrick(5, "expand brick", "", Option(CompositeValues()), proc2, "brick", "expandbrick", 5))//,
            //new Brick(proc, 3),
            //new Space(3, 1),new Space(3, 2))
          }

          proc2.elements_init // Important!

          proc2
    }


    "Create delaymiddleware" in {
      var reactionOpt:Option[UnitReaction] = None
      val appLogger: Logger = Logger(LoggerFactory.getLogger("build"))

      for( a <- 1 to 3000){
           println( "a: " + a );
      }
      for( a <- 1 to 3000){
           appLogger.info( "a: " + a)
      }
      true
}
}
/*
      "With strategy" in {
        val middleware = Middleware(
            id = Some(1L),
            ident = "delay"
        )
        val middleware1 = Middleware(
            id = Some(1L),
            ident = "delay"
        )
        val middleware2 = Middleware(
            id = Some(1L),
            ident = "delay"
        )
        val durationStrategy = Strategy(
          id = Some(1L), ident = "durationDelayStrategy")
        val scheduleStrategy = Strategy(
          id = Some(1L), ident = "scheduleDelayStrategy")
        middleware.pushToStrategies(durationStrategy)
        middleware1.pushToStrategies(scheduleStrategy)

        // They added?
        "They added?" in {
          middleware.strategies.length > 0
        }
        "Execute strategy" in {

        val resultmiddleware = middleware.executeStrategy()
        resultmiddleware.isDefined
        resultmiddleware.get.executed == true && resultmiddleware.get.resultedStrategy == "DurationStrategy"
        val resultmiddleware1 = middleware1.executeStrategy()
        resultmiddleware1.isDefined
        resultmiddleware1.get.executed == true && resultmiddleware1.get.resultedStrategy == "ScheduleStrategy"
        val resultmiddleware2 = middleware2.executeStrategy()
        resultmiddleware2.isDefined
        resultmiddleware2.get.executed == true && resultmiddleware2.get.resultedStrategy == "NullStrategy"
        }


        "Add reaction" in {
              val proc2 = new BProcess(new Managment)

              val reaction = UnitReaction(id = Some(1),
                                      bprocess = 1,
                                      autostart = true,
                                      element = 1,
                                      from_state=None,
                                      title="Make delay")
              val out1 = UnitReactionStateOut(id=Some(1),
              state_ref = 1,
              reaction = 1,
              on  = false)
              val out2 = UnitReactionStateOut(id=Some(2),
              state_ref = 1,
              reaction = 1,
              on  = false)


              reaction.reaction_state_outs += out1
              reaction.reaction_state_outs += out2
              reaction.middlewares += middleware
              reaction.execute(proc2)
              reactionOpt = Some(reaction)
              reaction.reaction_state_outs.length > 0
            "Is middleware added?" in {
                  reactionOpt.isDefined && reactionOpt.get.middlewares.length > 0
            }
            "Is middleware executed?" in {
                  reactionOpt.isDefined && reactionOpt.get.middlewares.length > 0
            }
        }
        // Create Delayed Ref
        "`Delayed ref` creation" in {
        	RefDAO.getByTitle("Timer").headOption match {
        		case Some(ref) => {
        			val refId = ref.id.get
        			refId > 0
val elem = UnitElementRef(id = None,
                        reflection = refId,
                        title = "Timer",
                        desc = "",
                        b_type = "",
                        type_title = "",
                        space_own = None,
                        order = 1)
val refElemId = ProcElemReflectionDAO.pull_object(elem)

val topo = RefElemTopology(id = None,
  reflection = refId,
  front_elem_id = Some(refElemId),
  space_elem_id = None,
  hash = "")
val topoId = ReflectElemTopologDAO.pull_object(topo)


val state1Id = BPStateRefDAO.pull_object(BPStateRef(
  None,
  reflection = refId,
  title = "started",
  neutral = "not started",
  process_state = false,
  on = false,
  on_rate = 0,
  front_elem_id = Some(refElemId),
  space_elem_id = None,
  space_id = None,
  created_at = Some(org.joda.time.DateTime.now),
  updated_at = Some(org.joda.time.DateTime.now),
  lang = "en",
  middle = "",
  middleable = false,
  oposite = "",
  opositable = false))
val state2Id = BPStateRefDAO.pull_object(BPStateRef(
  None,
  reflection = refId,
  title = "invoked",
  neutral = "not invoked",
  process_state = false,
  on = false,
  on_rate = 0,
  front_elem_id = Some(refElemId),
  space_elem_id = None,
  space_id = None,
  created_at = Some(org.joda.time.DateTime.now),
  updated_at = Some(org.joda.time.DateTime.now),
  lang = "en",
  middle = "",
  middleable = false,
  oposite = "",
  opositable = false))



val swId = SwitcherRefDAO.pull_object(UnitSwitcherRef(id = None,
reflection = refId,
switch_type = "p",
priority = 2,
state_ref = state2Id,
fn = "paused",
target = "process",
override_group = 0))

val reactionId = ReactionRefDAOF.pull_object(UnitReactionRef(
    id = None,
    reflection = refId,
    autostart = true,
    element = topoId,
    from_state = None,
    title = "Make delay"))

val reactionOutId = ReactionStateOutRefDAO.pull_object(UnitReactionStateOutRef(id: Option[Int],
  state_ref = -1, // ????
  reaction = reactionId,
  on = false,
  on_rate = 0
  ))
val midId = MiddlewareRefsDAOF.pull_object(MiddlewareRef(
    id = None,
    ident = "",
    reflection = refId,
    reaction = reactionId
  ))

val scheduleStrategyId = StrategyRefsDAOF.pull_object(StrategyRef(id = None,
        ident = "",
        reflection = refId,
        middleware = 1L))
val durationStrategyId = StrategyRefsDAOF.pull_object(StrategyRef(id = None,
        ident = "",
        reflection = refId,
        middleware = 1L))






        		}
        		case _ => {
        			val refId = RefDAO.pull_object(
        				Ref(
    	     			  None,
			              title = "Timer",
			              host = "",
			              desc = None,
			              created_at = None,
			              updated_at = None,
			              category = "Base",
			              hidden = false
        				))
        			refId > 0
        		}
        	}
        }

      }


    }








}
*/
