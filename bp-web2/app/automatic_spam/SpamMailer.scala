package automatic_spam_mailers
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
import scala.concurrent._
import scala.concurrent.duration._
object SpamMailer {
    def api:MandrillApi = new MandrillApi("t6kee7jRRARaB_6R3Cjtzg")
    def users = api.users()
    def ping = api.users().ping
	def getTemplate(invite_link: String = "https://min.ority.us",
                  templateName: String = "Beautiful2",
                  msg_text: String = "",
                  header_text: String = ""):String = {
		//views.html.mailer.ActorAdd.render("te","Te").toString
		val vars: scala.collection.Map[String,String] = Map("current_year" -> "2015",
                                                        "invite_list" -> invite_link,
                                                        "unsub" -> "",
                                                        "company" -> "Empire InCloud",
                                                        "msg_text" -> msg_text,
                                                        "header_text" -> header_text
                                                        )
		val jl: java.util.Map[String,String] = vars
		api.templates.render(templateName, jl, jl)

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

  def sendText(subject: String = "Minority App Notice",
           emails: List[String] = List(),
           text: String) = {
      ping
      val link:String = s"$text"
      emails.foreach { email =>
      val msg = new MandrillMessage()
      msg.setSubject(subject)
      msg.setHtml(getTemplate(link, "Beautiful3", text, subject))
      msg.setAutoText(true)
      msg.setFromEmail("a@minorityapp.com")
      msg.setFromName("Minority App")
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



	def sendInvite(subject: String = "Welcome | Minority Platform",
           emails: List[String] = List(),
           invite_link: String) = {
	    ping
      val link:String = s"https://min.ority.us/auth/signup/$invite_link"
      emails.foreach { email =>
      val msg = new MandrillMessage()
      msg.setSubject(subject)
      msg.setHtml(getTemplate(link))
      msg.setAutoText(true)
      msg.setFromEmail("a@minorityapp.com")
      msg.setFromName("Minority App")
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


  def fetchMembers():List[String] = {
  	val result = WS.url("https://us5.api.mailchimp.com/3.0/lists/6cb531884f/members?count=88").withAuth("apiKey", "e78fe34c7835335c66b52e6c2b7c05aa-us5", WSAuthScheme.BASIC).get()
    val response = Await.result(result, Duration(6000, MILLISECONDS)).json
    val emails:List[String] = (response \\ "email_address").toList.map(_.toString)
    emails
  }
  def subscribers() = {
    List(("test@minorityapp.com", "Minority Subscriber"))
  }



  import com.sendgrid._;
  import java.io.IOException;

  def sendTextGrid(subject: String = "Minority App Notice",
           emails: List[String] = List(),
           text: String) = {

             val from:Email = new Email("a@minorityapp.com");
             val subject:String = "Hello World from the SendGrid Java Library!";
             val to:Email = new Email("test@minorityapp.com");
             val content:Content = new Content("text/plain", "Hello, Email!");
             val mail:Mail = new Mail(from, subject, to, content);

             val sg:SendGrid = new SendGrid("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")
             val request: Request = new Request();
             request.method = Method.POST;
             request.endpoint = "mail/send";
             //request.body = mail.build();

             request.body = s"""
             {\"personalizations\":[{\"to\":[{\"email\":\"stan@minorityapp.com\"}, {\"email\":\"paul@minorityapp.com\"}],
             \"subject\":\"Test newslettering!\"}],
             \"from\":{\"email\":\"stan@minorityapp.com\"},
             \"content\":[{\"type\":\"text/html\",
               \"value\": \"Hello, Email!\"}],
             \"template_id" : \"8dcf1239-087c-478c-b0ce-8ddc7e8c787f\"}"""



             val response:Response = sg.api(request);
             println(response.statusCode);
             println(response.body);
             println(response.headers);
 }


}
