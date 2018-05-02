package api_schemas

import models.DAO._
import controllers._
import sangria.schema._
import sangria.marshalling._


import scala.concurrent.Future
import models.DAO.resources._
import scala.concurrent.ExecutionContext.Implicits._
import models.DAO._
import models.DAO.sessions._
import main.scala.bprocesses.BPSession
import org.joda.time._
import scala.util.{Try, Success, Failure}
import sangria.validation.{ValueCoercionViolation, IntCoercionViolation, BigIntCoercionViolation}
import org.joda.time.format._
import sangria._
import models.DAO.BProcessDTO
import models.DAO.BPDAO
import models.DAO._
import models.DAO.resources._
import models.DAO.CompositeValues
import play.api.Play.current
import main.scala.bprocesses.BPSession

import models.DAO.reflect._
import main.scala.bprocesses.refs._
import main.scala.bprocesses.refs.{BPStateRef}
import models.DAO.conversion._

/*
case class RefContainer(ref: Ref,
  unitelement:List[UnitElementRef],
  unitspace:List[UnitSpaceRef],
  unitspaceelement:List[UnitSpaceElementRef],
  topology: List[RefElemTopology],
  bpstate:List[BPStateRef],
  unitswitcher:List[UnitSwitcherRef],
  reactions: List[UnitReactionRef],
  reaction_state_outs: List[UnitReactionStateOutRef],
  reaction_cn: List[ReactionContainer],
  middlewares: Seq[MiddlewareRef] = Seq(),
  strategies: Seq[StrategyRef] = Seq(),
  inputs: Seq[StrategyInputRef] = Seq(),
  bases: Seq[StrategyBaseRef] = Seq(),
  outputs: Seq[StrategyOutputRef] = Seq()
)


case class ReactionContainer(reaction: UnitReactionRef,
  reaction_state_outs: List[UnitReactionStateOutRef])


*/

object RefSchema {
  val UnitRefs = ObjectType("UnitRefs", "UnitRef",
    fields[CharacterRepo2, Ref](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1) )
    ),

    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("host", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.host )
    ),
    Field("desc", OptionType(StringType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.desc )
    ),        
    Field("category", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.category )
    ),
    Field("hidden", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.hidden )
    ),    
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )        

  ))


  val UnitElements = ObjectType("UnitElementsRef", "UnitElementRef",
    fields[CharacterRepo2, UnitElementRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("desc", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.desc )
    ),
    Field("b_type", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.b_type )
    ),
    Field("type_title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.type_title )
    ),
    Field("space_own", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_own )
    ),
    Field("order", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.order )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )                                    
  ))




  val UnitSpaces = ObjectType("UnitSpacesRef", "UnitSpaceRef",
    fields[CharacterRepo2, UnitSpaceRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("index", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.index )
    ),
    Field("container", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.container )
    ),
    Field("subbrick", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.subbrick )
    ),
    Field("brick_front", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.brick_front )
    ),
    Field("brick_nested", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.brick_nested )
    ),
    Field("nestingLevel", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.nestingLevel )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )                                    
  ))



  val UnitSpaceElements = ObjectType("UnitSpaceElementsRef", "UnitSpaceElementRef",
    fields[CharacterRepo2, UnitSpaceElementRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("desc", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.desc )
    ),
    Field("b_type", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.b_type )
    ),
    Field("type_title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.type_title )
    ),
    Field("ref_space_own", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_own )
    ),
    Field("ref_space_owned", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.ref_space_owned )
    ),
    Field("space_role", OptionType(StringType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_role )
    ),
    Field("order", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.order )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))



  val Topologies = ObjectType("TopologiesRef", "TopologyRef",
    fields[CharacterRepo2, RefElemTopology](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("hash", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.hash )
    ),
    Field("front_elem_id", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.front_elem_id )
    ),
    Field("space_elem_id", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_elem_id )
    ),
    Field("space_id", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_id )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )    
  ))



  val BPStates = ObjectType("BPStatesRef", "BPStateRef",
    fields[CharacterRepo2, BPStateRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("neutral", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.neutral )
    ),
    Field("process_state", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.process_state )
    ),
    Field("on", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.on )
    ),
    Field("on_rate", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("space_id", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_id )
    ),
    Field("front_elem_id", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.front_elem_id )
    ),
    Field("space_elem_id", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.space_elem_id )
    ),
    Field("middle", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.middle )
    ),
    Field("middleable", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.middleable )
    ),
    Field("oposite", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.oposite )
    ),
    Field("opositable", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.opositable )
    ),
    Field("lang", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.lang )
    ),
    Field("created_at",  OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at",  OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )
  ))



  val UnitSwitchers = ObjectType("UnitSwitchersRef", "UnitSwitcherRef",
    fields[CharacterRepo2, UnitSwitcherRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("switch_type", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.switch_type )
    ),
    Field("priority", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.priority )
    ),
    Field("state_ref", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.state_ref )
    ),
    Field("fn", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.fn )
    ),
    Field("target", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.target )
    ),
    Field("override_group", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.override_group )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )
  ))

  val Reactions = ObjectType("ReactionsRef", "ReactionRef",
    fields[CharacterRepo2, UnitReactionRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("autostart", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.autostart )
    ),
    Field("element", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.element )
    ),
    Field("from_state", OptionType(IntType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.from_state )
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))



  val ReactionStateOuts = ObjectType("ReactionStateOutsRef", "ReactionStateOutRef",
    fields[CharacterRepo2, UnitReactionStateOutRef](
    Field("id", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1))
    ),
    Field("reaction", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reaction )
    ),
    Field("state_ref", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.state_ref )
    ),
    Field("on", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.on )
    ),
    Field("on_rate", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.on_rate )
    ),
    Field("is_input", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.is_input )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))


  val ReactionContainers = ObjectType("ReactionContainersRef", "ReactionContainerRef",
    fields[CharacterRepo2, ReactionContainer](

    Field("reaction", Reactions, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reaction )
    ),
    Field("reaction_state_outs", ListType(ReactionStateOuts), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reaction_state_outs )
    )
  ))


  val Middlewares = ObjectType("MiddlewaresRef", "MiddlewareRef",
    fields[CharacterRepo2, MiddlewareRef](
    Field("id", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1L))
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("ident", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.ident )
    ),
    Field("ifaceIdent", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.ifaceIdent )
    ),
    Field("reaction", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reaction )
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )    

  ))


  val Strategies = ObjectType("StrategiesRef", "StrategyRef",
    fields[CharacterRepo2, StrategyRef](


    Field("id", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1L))
    ),
    Field("ident", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.ident )
    ),
    Field("reflection", IntType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.reflection )
    ),
    Field("middleware", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.middleware )
    ),
    Field("isNullStrategy", BooleanType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.isNullStrategy )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))


  val Inputs = ObjectType("InputsRef", "InputRef",
    fields[CharacterRepo2, StrategyInputRef](

    Field("id", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1L))
    ),
    Field("strategy", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.strategy )
    ),
    Field("op", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.op )
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("desc", OptionType(StringType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.desc )
    ),
    Field("ident", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.ident )
    ),
    Field("targetType", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.targetType )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))


  val Bases = ObjectType("BasesRef", "BaseRef",
    fields[CharacterRepo2, StrategyBaseRef](
    Field("id", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1L))
    ),
    Field("strategy", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.strategy )
    ),
    Field("key", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.key )
    ),
    Field("baseType", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.baseType )
    ),
    Field("valueType", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.valueType )
    ),
    Field("valueContent", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.valueContent )
    ),
    Field("validationScheme", OptionType(StringType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.validationScheme )
    ),
    Field("validationPattern", OptionType(StringType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.validationPattern )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))



  val Outputs = ObjectType("OutputsRef", "OutputRef",
    fields[CharacterRepo2, StrategyOutputRef](
    Field("id", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.id.getOrElse(-1L))
    ),
    Field("strategy", LongType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.strategy )
    ),
    Field("op", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.op )
    ),
    Field("title", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.title )
    ),
    Field("desc", OptionType(StringType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.desc )
    ),
    Field("ident", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.ident )
    ),
    Field("targetType", StringType, Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.targetType )
    ),
    Field("created_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.created_at )
    ),
    Field("updated_at", OptionType(DateHelper.DateTimeType), Some("|unitelement|"), resolve = ctx =>
      Future.successful(ctx.value.updated_at )
    )

  ))








  ///// MAIN SCHEMA

  val schema = ObjectType("RefsSch", "RefSch",
    fields[CharacterRepo2, RefContainer](

Field("ref", UnitRefs, Some("|unitelement|"), resolve = ctx =>
  Future.successful(ctx.value.ref)
),

Field("unitelement", ListType(UnitElements), Some("|unitelement|"), resolve = ctx =>
  Future.successful(ctx.value.unitelement)
),
Field("unitspace", ListType(UnitSpaces), Some("|unitspace|"), resolve = ctx =>
  Future.successful(ctx.value.unitspace)
),
Field("unitspaceelement", ListType(UnitSpaceElements), Some("|unitspaceelement|"), resolve = ctx =>
  Future.successful(ctx.value.unitspaceelement)
),
Field("topology", ListType(Topologies), Some("|topology|"), resolve = ctx =>
  Future.successful(ctx.value.topology)
),
Field("bpstate", ListType(BPStates), Some("|bpstate|"), resolve = ctx =>
  Future.successful(ctx.value.bpstate)
),
Field("unitswitcher", ListType(UnitSwitchers), Some("|unitswitcher|"), resolve = ctx =>
  Future.successful(ctx.value.unitswitcher)
),
Field("reactions", ListType(Reactions), Some("|reactions|"), resolve = ctx =>
  Future.successful(ctx.value.reactions)
),
Field("reaction_state_outs", ListType(ReactionStateOuts), Some("|reaction_state_outs|"), resolve = ctx =>
  Future.successful(ctx.value.reaction_state_outs)
),
Field("reaction_cn", ListType(ReactionContainers), Some("|reaction_cn|"), resolve = ctx =>
  Future.successful(ctx.value.reaction_cn)
),
Field("middlewares", ListType(Middlewares), Some("|middlewares|"), resolve = ctx =>
  Future.successful(ctx.value.middlewares)
),
Field("strategies", ListType(Strategies), Some("|strategies|"), resolve = ctx =>
  Future.successful(ctx.value.strategies)
),
Field("inputs", ListType(Inputs), Some("|inputs|"), resolve = ctx =>
  Future.successful(ctx.value.inputs)
),
Field("bases", ListType(Bases), Some("|bases|"), resolve = ctx =>
  Future.successful(ctx.value.bases)
),
Field("outputs", ListType(Outputs), Some("|outputs|"), resolve = ctx =>
  Future.successful(ctx.value.outputs)
)


    )
  ) 



}