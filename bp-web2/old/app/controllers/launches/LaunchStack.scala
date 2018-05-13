package controlles.launches
import scala.collection.mutable.ListBuffer

object LaunchStack {
	var launchesIds:ListBuffer[Int] = ListBuffer()

	def push(launchId: Int):Boolean = {
		launchesIds.find(id => id == launchId) match {
			case Some(lId) => false
			case _ =>  launchesIds += launchId;  true 
		}
	}
	def pop(launchId: Int):Boolean = {
		launchesIds.find(id => id == launchId) match {
			case Some(lId) => launchesIds -= lId;true
			case _ => false
		}		
	}

}