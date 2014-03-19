package models.DAO
import main.scala.utils.ElementTracer
import main.scala.simple_parts.process.CompositeValues

object Caster {
  def cast(undef: UndefElement, proc: BProcess) = {
    val tag = ElementTracer.findByInfo(undef.b_type, undef.type_title)


    (undef.b_type, undef.type_title) match {
      case ("block", "test_block") => tag.instanciate(tag.classTag.newInstance(undef.title,
                                                                               undef.desc,
                                                                               CompositeValues(),
                                                                               proc,
                                                                               undef.b_type,
                                                                               undef.type_title,
                                                                               undef.order,
                                                                               undef.space,
                                                                               undef.space_role))
    }
    // push to bp OR space
    println(undef.business)
  }


}
