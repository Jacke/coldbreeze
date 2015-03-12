package bprocess_invoke
import org.specs2.mutable._
import main.scala.bprocesses.BPState 

  
/**
 * Created by Sobolev on 12.03.2015.
 * P.S. Idea too heavy ;)
 
 */
class HelperElementSpec extends Specification {


 "State" should {
   val state = BPState(None, 1,1, title = "confirmed", opposite = "")
    "craftable" in {
      state.title == "confirmed"
    }
   "oppositable" in {
      state.opposite == "unconfirmed"
    }
  }
  
// Switches 
  
// Transitions
   
  
}
