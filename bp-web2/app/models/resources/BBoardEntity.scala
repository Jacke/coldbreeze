// BBoardEntity.scala
// entity_type
// default_value
// title
// desc
package models.DAO
case class BBoardEntity(entity_type:String,title:String,default_value:Option[String] = None,desc:Option[String] = None) {
    def json_type:String = { "json: type" }
}

object BBoardEntities {
	// def create() = { }
	// def update(id: String, obj: BBoardEntity) = { }
	def fetch(id: String):Option[BBoardEntity] = { Some(BBoardEntity(entity_type = s"string $id",
						default_value = Some("test"),
						title = "Test string")) } 
	// def delete(id: String) = { }
}