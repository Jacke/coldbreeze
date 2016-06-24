package main.scala.bprocesses

import com.typesafe.scalalogging.Logger
import main.scala.simple_parts.process._
import main.scala.utils.Space
import main.scala.bprocesses._
import main.scala.simple_parts.process.Units._


trait InvokeElemDataLogger {
	def printToConsoleElemData(elem: ProcElems) = {
      NInvoker.toApplogger("Switchers:")
      elem.session_states.foreach { state => 
        NInvoker.toApplogger(state.title + " " + state.switchers.length.toString)
        state.switchers.foreach(sw => NInvoker.toApplogger(sw.toString))
       }
      NInvoker.toApplogger("**** RUN" + elem.toString + " ****")
	}

}