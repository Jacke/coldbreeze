import _root_.main.scala.bprocesses.refs.UnitRefs._
import _root_.main.scala.simple_parts.process.Units._
import us.ority.min.actions._

val middleware = Middleware(
  Some( 0L ),"ident","ifaceIdent",-1
)
val nullSt = Strategy(None, "ident", middleware.id.get, true)

val st = Strategy(None, "ident", middleware.id.get, false)

nullSt.isNullStrategy
st.isNullStrategy
