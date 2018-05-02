package decorators
import main.scala.bprocesses.BPSession  
import models.DAO._

case class SessionDecorator(p: BProcessDTO, sessions: List[BPSession])


