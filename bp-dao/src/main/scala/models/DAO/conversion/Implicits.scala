package models.DAO.conversion

import main.scala.simple_parts.process.data.{Confirm, Note}
import main.scala.utils.Space
import models.DAO.{BPSpaceDTO, SpaceElementDTO, CompositeValues, UndefElement}

//import main.scala.simple_parts.process.CompositeValues
import main.scala.simple_parts.process.{ProcElems, Block}

object Implicits {


  /**
   * Cast ProcElemDTO to Origin ProcElem
   * @param undef DTO of ProcElem
   * @param proc BProcess
   * @return casted ProcElem
   */
  def fromProcElemDTO(undef: UndefElement, proc: main.scala.bprocesses.BProcess) = {

    (undef.b_type, undef.type_title) match {
      case ("block", "note") => new Note( undef.id.get,
                                          undef.title,
                                          undef.desc,
                                          None,
                                          proc,
                                          undef.b_type,
                                          undef.type_title,
                                          undef.order,
                                          None)
      case ("block", "confirm") => new Confirm(undef.id.get,
                                               undef.title,
                                               undef.desc,
                                               None,
                                               proc,
                                               undef.b_type,
                                               undef.type_title,
                                               undef.order,
                                               None)
      case ("block", "test_block") => new Block(undef.id.get,
                                                undef.title,
                                                undef.desc,
                                                None,
                                                proc,
                                                undef.b_type,
                                                undef.type_title,
                                                undef.order,
                                                None) // Option(proc.getSpaceByIndex(undef.space_own.getOrElse(None))))
    }
  }

  /**
   * Cast SpaceElemDTO to Origin with Space signature
   * @param undef DTO of SpaceElem
   * @param proc BProcess
   * @return
   */
  def fromSpaceElemDTO(undef: SpaceElementDTO, proc: main.scala.bprocesses.BProcess, spaces: List[BPSpaceDTO]) = {
    (undef.b_type, undef.type_title) match {
      case ("block", "test_block") => new Block(undef.id.get,
        undef.title,
        undef.desc,
        None,//fetch_cv(undef.comps),
        proc,
        undef.b_type,
        undef.type_title,
        undef.order,
        space_parent = findSpParent(proc.spaces, spaces, undef),
        space_role   = undef.space_role
        )
    }
  }

  /**
   * Find Origin Space Parent for Space Element DTO
   * @param orig Array of Origin Spaces
   * @param dto List of BPSpaceDTO
   * @param elem SpaceElement DTO
   * @return Origin Space
   */
  def findSpParent(orig: Array[Space], dto: List[BPSpaceDTO], elem: SpaceElementDTO):Option[Space] = {
    orig.find(sp => sp.index == dto.find(sp => sp.id == Some(elem.space_owned)).get.index )
  }

  /**
   * Retrive DB CV to OriginCV
   * @param cv from db
   * @return Option(OriginCV)
   */
  def fetch_cv(cv: Option[List[CompositeValues]]): Option[main.scala.simple_parts.process.CompositeValues] = {
    cv match {
    case Some(cvlist) => {
      val x = cvlist.head
      Option(main.scala.simple_parts.process.CompositeValues(
                                                      x.a_string,
                                                      x.b_string,
                                                      x.a_int,
                                                      x.b_int,
                                                      x.a_bool,
                                                      x.b_bool
                                                      )
      )
    }
    case None => { None }
    }
  }
  def pull_cv(cv: Option[main.scala.simple_parts.process.CompositeValues]): Option[List[CompositeValues]] = {
    cv match {
      case Some(x) => {
        Option(List(CompositeValues(
          x.a_string,
          x.b_string,
          x.a_int,
          x.b_int,
          x.a_bool,
          x.b_bool
        )
        ))

      }
      case _ => None
    }
  }




}
