package models.utils
import models.DAO._
/****
 * Process elements may have symbolic links of each other
 * Element -> space -> Element
 * This object fill that link it, after creation.
 */
object IdAfterBurner {
	// ELEMENT SPACE OWN
	def elSpaceOwn(space: BPSpaceDTO) = {
		if (space.brick_front.isDefined) {
		  ProcElemDAO.findById(space.brick_front.get).get.copy(space_own = space.id)
	    } else {
	      SpaceElemDAO.findById(space.brick_nested.get).get.copy(space_own = space.id)
	    }
	}
}

