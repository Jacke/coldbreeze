import java.io.File
import java.io._

import play.api.{Play, DefaultApplication, Mode}
import play.core.ApplicationProvider
import scala.util.{Try, Properties}

/**
  */
object DevNettyServer extends App {
  new NettyServer(Mode.Dev)
}

object ProdNettyServer extends App {
  new NettyServer(Mode.Prod)
}

class NettyServer(mode: Mode.Value) {
  if (Properties.propIsSet("config.file")) System.clearProperty("config.resource")

  "-Dfile.encoding=utf-8 -Djava.net.preferIPv4Stack=true".split(" ").foreach {
    prop =>
      prop.split("=") match {
        case Array(name, value) => System.setProperty(name.drop(2), value)
      }
  }

  new play.core.server.NettyServer(
    new StaticApplication(new File(System.getProperty("user.dir")), mode),
    Option(System.getProperty("http.port")).map(Integer.parseInt).orElse(Some(9000)),
    //Option(System.getProperty("https.port")).map(Integer.parseInt),
    None.map(Integer.parseInt),
    Option(System.getProperty("http.address")).getOrElse("0.0.0.0")
    , mode
  )
}

class StaticApplication(applicationPath: File, mode: Mode.Value) extends ApplicationProvider 
{
   java.lang.management.ManagementFactory.getRuntimeMXBean.getName.split('@').headOption.map { pid =>
      val pidFile = Option(System.getProperty("pidfile.path")).map(new File(_)).getOrElse(new File(applicationPath.getAbsolutePath, "RUNNING_PID"))
////////////////////////////////--://///////////////////////////--://///////////////////////////////
/////////////////////////////:.    .:////////////////////////:.`   `-///////////////////////////////
///////////////////////////-`        `-://////////////////:-`        `.:////////////////////////////
////////////////////////:.`             `-//////////////-.              `-://///////////////////////
//////////////////////-.                  `.:////////:.`                   .:///////////////////////
////////////////////-`                       `-:///-`                        `-:////////////////////
/////////////////:.                             ..                              .://////////////////
/////////////////.                                                               -//////////////////
/////////////////.        `                                            ``        -//////////////////
/////////////////.         `.`                                       ..`         -//////////////////
/////////////////.           `-.`                                 `-.`           -//////////////////
/////////////////.             `--`                            `.:-`             -//////////////////
/////////////////.               -/:.`                       .:/:`               -//////////////////
/////////////////.            `-://///-.                  `-/////:-`             -//////////////////
/////////////////.          `-//////////:-`             .://////////:.           -//////////////////
/////////////////.       `.:///////////////:.        `-////////////////-`        -//////////////////
/////////////////.     `-////////////////////:-`  `-:////////////////////:.`     -//////////////////
/////////////////.  `.://///////////////////////:://////////////////////////:.   -//////////////////
/////////////////..-//////////////////////////////////////////////////////////:-`://////////////////

      println(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,")
      println(",,,,,,,,,,,,,,,,, ,,,,,,,,,,,,,,,.`,,,,,,,,,,,,,,,,,")
      println(",,,,,,,,,,,,,,,,   ,,,,,,,,,,,,,    ,,,,,,,,,,,,,,,,")
      println(",,,,,,,,,,,,,,.     .,,,,,,,,,,      ,,,,,,,,,,,,,,,")
      println(",,,,,,,,,,,,,`        ,,,,,,,,        .,,,,,,,,,,,,,")
      println(",,,,,,,,,,,,           ,,,,,           `,,,,,,,,,,,,")
      println(",,,,,,,,,,,             ,,,              ,,,,,,,,,,,")
      println(",,,,,,,,,,               `                ,,,,,,,,,,")
      println(",,,,,,,,,                                 ,,,,,,,,,,")
      println(",,,,,,,,,    `                            ,,,,,,,,,,")
      println(",,,,,,,,,     `                     .     ,,,,,,,,,,")
      println(",,,,,,,,,      `                   ,      ,,,,,,,,,,")
      println(",,,,,,,,,        .                ,       ,,,,,,,,,,")
      println(",,,,,,,,,         ,             `,        ,,,,,,,,,,")
      println(",,,,,,,,,        ,,,           ,,,`       ,,,,,,,,,,")
      println(",,,,,,,,,       ,,,,,`        ,,,,,,      ,,,,,,,,,,")
      println(",,,,,,,,,     .,,,,,,,,      ,,,,,,,,     ,,,,,,,,,,")
      println(",,,,,,,,,    ,,,,,,,,,,,   .,,,,,,,,,,    ,,,,,,,,,,")
      println(",,,,,,,,,   ,,,,,,,,,,,,, ,,,,,,,,,,,,,.  ,,,,,,,,,,")
      println(",,,,,,,,,  ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,, ,,,,,,,,,,")
      println(",,,,,,,,,`,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,")
      println(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,")
      println("Minority platform server process ID is " + pid + " ")
      println()      
      println(s"IP: ${Option(System.getProperty("http.address")).getOrElse("0.0.0.0")}")
      println(s"PORT: ${Option(System.getProperty("http.port")).map(Integer.parseInt).getOrElse(9000)}")
      println(s"Copyright 2014-2016 Empire inCloud")
      println(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,")
      println()

      if (pidFile.getAbsolutePath != "/dev/null") {
        if (pidFile.exists && mode == Mode.Prod) {
          println("This application is already running (Or delete " + pidFile.getAbsolutePath + " file).")
          System.exit(-1)
        }

        new FileOutputStream(pidFile).write(pid.getBytes)
        Runtime.getRuntime.addShutdownHook(new Thread {
          override def run {
            pidFile.delete()
          }
        })
      }
    }

  val application = new DefaultApplication(applicationPath, this.getClass.getClassLoader, 
None, mode)
  Play.start(application)
  def get = Try(application)
  def path = applicationPath
}
