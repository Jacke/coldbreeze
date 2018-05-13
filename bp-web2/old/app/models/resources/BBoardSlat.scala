// BBoardSlat.scala
// slat_value
// entity_ref
// meta: session_id, elem_id
package models.DAO

case class BBoardSlat(slat_value:String,
					  entity_ref:String,
					  meta:List[String] = List.empty) {
	def schemaGenerate() = {
		BBoardEntities.fetch(entity_ref) match {
			case Some(entity) => entity.json_type
			case _ => ""
		}
	}
}

object BBoardSlats {
	// def create() = { }
	// def update(id: String, obj: BBoardSlat) = { }
	// def fetch(id: String) = { } 
	// def delete(id: String) = { }
}