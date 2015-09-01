package mailers
import com.microtripit.mandrillapp.lutung._
import com.microtripit.mandrillapp.lutung.MandrillApi
import com.microtripit.mandrillapp.lutung.controller._
import com.microtripit.mandrillapp.lutung.model._
import com.microtripit.mandrillapp.lutung.view._
import java.util.ArrayList
import com.microtripit.mandrillapp.lutung.view.MandrillMessage.Recipient
import scala.collection.mutable.ListBuffer
import scala.collection.JavaConverters._
import scala.collection.JavaConversions._
import scala.concurrent.Future
import play.api.Play
import play.api.Logger
import play.api.Play.current
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.ws.{ WSResponse, WS }
import com.ning.http.client.Realm.AuthScheme
import play.api.libs.ws._
object Mailer {
    def api:MandrillApi = new MandrillApi("lzbqtT4PxFu4hSMzkdfh0w")
    def users = api.users()
    def ping = api.users().ping
	def getTemplate(invite_link: String = "https://min.ority.us"):String = {
		//views.html.mailer.ActorAdd.render("te","Te").toString
		val vars: scala.collection.Map[String,String] = Map("current_year" -> "2015", 
                                                        "invite_list" -> invite_link,
                                                        "unsub" -> "",
                                                        "company" -> "Empire InCloud"
                                                        )
		val jl: java.util.Map[String,String] = vars
		api.templates.render("Minority", jl,jl)

	}
  /*
  def testSend(subject: String, body: String = "") = {
        if (body == "") {
        	send(subject, getTemplate(), List(), "")
        } else {
    	    send(subject, body, List(), "")
        }  
  }
  */

	def sendInvite(subject: String = "test",
           emails: List[String] = List(), 
           invite_link: String) = {
	    ping
      emails.foreach { email =>
      val msg = new MandrillMessage()
      msg.setSubject(subject)
      msg.setHtml(getTemplate(invite_link))
      msg.setAutoText(true)
      msg.setFromEmail("a@minorityapp.com")
      msg.setTo(makeRecipients(Map(email -> "Minority Subscriber")))
      msg.setPreserveRecipients(true)
      /*
		ArrayList<String> tags = new ArrayList<String>();
		tags.add("test");
		tags.add("helloworld");
		message.setTags(tags);      
      */
      api.messages().send(msg, false)
      }
	}
    private def makeRecipients(recs: Map[String, String]):java.util.ArrayList[Recipient] = {
    	var recipients:ArrayList[Recipient] = new ArrayList[Recipient]

    	val recToList = recs.map { x =>
    		val email = x._1
    		val name = x._2
    		val rec = new Recipient
    		rec.setEmail(email)
    		rec.setName(name)
    		recipients.add(rec)
    	}
    	recipients
    }


    /***
     Mailchimp
    **/
  private val MailChimpConfigMock = "mailchimp.mock"
  private val MailChimpConfigListId = "mailchimp.list_id"
  private val MailChimpConfigApiKey = "mailchimp.api_key"
  private val ApiKeyFormat = "[^-]*-(.*)".r
  private val MailChimpApiEndPoint = "http://%s.api.mailchimp.com/2.0/"
  private def MailChimpApi(dataCenter: String): String = MailChimpApiEndPoint.format(dataCenter)
  private val ListSubscribe = "?method=listSubscribe"

  def subscribe(email: String) = //: Option[Future[WSResponse]] =
    for {
      mock <- Some(false)//getBooleanConfigValue(MailChimpConfigMock)
      if (!mock)
      listId <- Some(56193)//getStringConfigValue(MailChimpConfigListId)
      apiKey <- Some("e78fe34c7835335c66b52e6c2b7c05aa-us5")//getStringConfigValue(MailChimpConfigApiKey)
      listSubscribeMethod <- createListSubscribeMethod(apiKey)
    } yield {
      val params = Map(
        "apikey" -> Seq(apiKey),
        "id" -> Seq(listId),
        "email_address" -> Seq(email),
        "double_optin" -> Seq("false"))
      //WS.url(listSubscribeMethod).post(params)
    }

  private def createListSubscribeMethod(apiKey: String): Option[String] =
    for (ApiKeyFormat(dataCenter) <- ApiKeyFormat.findFirstIn(apiKey))
      yield MailChimpApi(dataCenter) + ListSubscribe
  private def getSubscribers(apiKey: String): Option[String] =
      for (ApiKeyFormat(dataCenter) <- ApiKeyFormat.findFirstIn(apiKey))
      yield MailChimpApi(dataCenter) + ListSubscribe

  private def getBooleanConfigValue(key: String): Option[Boolean] = None//Play.current.configuration.getBoolean(key)
  private def getStringConfigValue(key: String): Option[String] = None//Play.current.configuration.getString(key)


  def fetchMembers() = {
  	val result = WS.url("https://us5.api.mailchimp.com/3.0/lists/6cb531884f/members?count=88").withAuth("apiKey", "e78fe34c7835335c66b52e6c2b7c05aa-us5", WSAuthScheme.BASIC).get()
    val response = result.value.get.get.json
    val emails:List[String] = (response \\ "email_address").toList.map(_.toString)
  }
  def subscribers() = { List(
("test3@minorityapp.com", "Minority Subscriber","dba1ebf7-2306-403a-98b7-10d20623550a"),    
("shabaz@appscinated.com","Minority Subscriber", "8754d3e0-2eb7-4cde-863e-b8f17f2939f3"),
("nicolas.de_luis_merino@edu.escpeurope.eu","Minority Subscriber", "45881114-92f0-4a47-bacf-c6b29a1d99c1"),
("miloscitakovic@gmail.com","Minority Subscriber", "9cf80e07-3342-4086-9461-e860a2693e40"),
("condetega+minorityapp@gmail.com","Minority Subscriber", "a4d1f1e4-b6b7-4bec-ad6c-2bfce325710f"),
("2four5oh3@gmail.com","Minority Subscriber", "3278bc63-65d2-4786-b8ed-293643066ef4"),
("see@guol.in","Minority Subscriber", "3d05d9de-0c27-41a6-80eb-f698aa51f06a"),
("gerald.c.hensel@gmail.com","Minority Subscriber", "91ec624e-15bc-413d-afb5-86a70dd89d0d"),
("thomaslloyd22@gmail.com","Minority Subscriber", "3f5ddbe1-3c29-4ae4-8d2e-228495eb8905"),
("johanssons.davids@gmail.com","Minority Subscriber", "fb57d8d6-413c-473a-83b0-df0fcfc95204"),
("scott@clearlogic.co.uk","Minority Subscriber", "01b25a47-07b3-4187-9d77-8e547ea43c23"),
("kunal@oxyzeninfolab.com","Minority Subscriber", "d4483342-74f2-4c2b-a465-78b3451a00fa"),
("xirofog@landmail.co","Minority Subscriber"),
("hazel@dalejennings.co.nz","Minority Subscriber"),
("greg@gregarmstrong.com.au","Minority Subscriber"),
("dsbenbow@yahoo.com","Minority Subscriber"),
("fdsds@fasaf.ru","Minority Subscriber"),
("iamjacke@gmail.com","Minority Subscriber"),
("sachin.tensingh17@gmail.com","Minority Subscriber"),
("shabalov.alexander@gmail.com","Minority Subscriber"),
("chuckwebstermd@gmail.com","Minority Subscriber"),
("miciver@gmail.com","Minority Subscriber"),
("romaamorales@ymail.com","Minority Subscriber"),
("andres.jaramillo.o@gmail.com","Minority Subscriber"),
("alvino@gmail.com","Minority Subscriber"),
("dnsdns@gmail.com","Minority Subscriber"),
("hello@antonellasinigaglia.com","Minority Subscriber"),
("dylan.mullins@getbuilt.com","Minority Subscriber"),
("joey.elmann@gmail.com","Minority Subscriber"),
("pedro.custodio@gmail.com","Minority Subscriber"),
("adolfo84@hotmail.com","Minority Subscriber"),
("therealteresa2013@gmail.com","Minority Subscriber"),
("thomas.vipin@gmail.com","Minority Subscriber"),
("oink@verspiglad.co.uk","Minority Subscriber"),
("ravin@wegreenlight.com","Minority Subscriber"),
("bal@jhat.com","Minority Subscriber"),
("esbaptista@gmail.com","Minority Subscriber"),
("furiostyles@outlook.com","Minority Subscriber"),
("rsababady@pro.onet.pl","Minority Subscriber"),
("marc@afriendofmine.nl","Minority Subscriber"),
("Michaelsaia522@gmail.com","Minority Subscriber"),
("joshhardman@me.com","Minority Subscriber"),
("nhouck@gmail.com","Minority Subscriber"),
("monesh@cloudbooksapp.com","Minority Subscriber"),
("sarah@jadu.co.uk","Minority Subscriber"),
("goldmanjordan@gmail.com","Minority Subscriber"),
("hi@lp-32.com","Minority Subscriber"),
("tyler@eventfultimes.net","Minority Subscriber"),
("doug.ireland@prezi.com","Minority Subscriber"),
("sappenin@gmail.com","Minority Subscriber"),
("rmartin@symbilitysolutions.com","Minority Subscriber"),
("adilansari90@yahoo.com","Minority Subscriber"),
("dkachele@gmail.com","Minority Subscriber"),
("mvalles36@gmail.com","Minority Subscriber"),
("paul@republicpro.com","Minority Subscriber"),
("nnnekit@gmail.com","Minority Subscriber"),
("juices-woo@mail.ru","Minority Subscriber"),
("vivekpratapsingh47@yahoo.com","Minority Subscriber"),
("jsmowgood@gmail.com","Minority Subscriber"),
("ganders@me.com","Minority Subscriber"),
("Theanswerzone@gmail.com","Minority Subscriber"),
("danencarlson@gmail.com","Minority Subscriber"),
("ron.bentata@gmail.com","Minority Subscriber"),
("marketa.kabat@gmail.com","Minority Subscriber"),
("j.faassen@linkorb.com","Minority Subscriber"),
("muench@si-labs.com","Minority Subscriber"),
("christine@faureandco.fr","Minority Subscriber"),
("i@5.c","Minority Subscriber"),
("hdemarest@leanpath.com","Minority Subscriber"),
("rgossen@rebarinteractive.com","Minority Subscriber"),
("cristiam86@gmail.com","Minority Subscriber"),
("barry@handmademarketing.ie","Minority Subscriber"),
("niko@nnyman.com","Minority Subscriber"),
("bugra@pasifik1.com","Minority Subscriber"),
("todd.giannattasio@tresnicmedia.com","Minority Subscriber"),
("wendelin@chillbill.co","Minority Subscriber"),
("dd@swservice.biz","Minority Subscriber"),
("ideaing@hanmail.net","Minority Subscriber"),
("dannonl@hotmail.com","Minority Subscriber"),
("sreejithgovind@gmail.com","Minority Subscriber"),
("okappy.biz@gmail.com","Minority Subscriber"),
("flytoe@gmail.com","Minority Subscriber"),
("durwin89@gmail.com","Minority Subscriber"),
("justincaywood111@hotmail.com","Minority Subscriber"),
("vedarthk@vedarthz.in","Minority Subscriber"),
("juices.woo@gmail.com","Minority Subscriber"),
("rickghome@gmail.com","Minority Subscriber"),
("aroberts025@gmail.com","Minority Subscriber"),
("avitelyas@gmail.com","Minority Subscriber"))

  }
}
