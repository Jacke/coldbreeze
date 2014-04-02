package models.DAO
import main.scala.utils.ElementTracer
import main.scala.utils.Keepr
//import main.scala.simple_parts.process.CompositeValues
import main.scala.simple_parts.process.Block

object Caster {
  def cast(undef: UndefElement, proc: main.scala.bprocesses.BProcess) = {
    //val tag = ElementTracer.findByInfo(undef.b_type, undef.type_title).get


    (undef.b_type, undef.type_title) match {
      case ("block", "test_block") => new Block(undef.id.get,
                                                undef.title,
                                                undef.desc,
                                                Option(main.scala.simple_parts.process.CompositeValues()),
                                                proc,
                                                undef.b_type,
                                                undef.type_title,
                                                undef.order,
                                                Option(proc.getSpaceByIndex(undef.space_parent.get)),
                                                undef.space_role)
    }
    // push to bp OR space
    println(undef.business)
  }


}
