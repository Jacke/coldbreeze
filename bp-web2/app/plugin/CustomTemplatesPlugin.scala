package controllers.plugin

import securesocial.controllers._
import play.api.mvc.{Controller, RequestHeader}
import play.twirl.api.{Html, Txt}
import securesocial.core.{BasicProfile, RuntimeEnvironment}
import play.api.data.Form
import play.api.i18n.Lang

object ViewTemplates1 {
  /**
   * The default views.
   */
  def Default(env: RuntimeEnvironment) = new Default1(env)
  class Default1(env: RuntimeEnvironment) extends ViewTemplates {
    implicit val implicitEnv = env

    override def getLoginPage(form: Form[(String, String)],
                              msg: Option[String] = None)(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      play.twirl.api.Html("") //views.html.custom.login(form, msg)(request, lang, env)
    }

    override def getSignUpPage(form: Form[RegistrationInfo], token: String)(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      play.twirl.api.Html("") //views.html.custom.signUp(form, token)(request, lang, env)
    }

    override def getStartSignUpPage(form: Form[String])(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      println("getStartSignUpPage")
      play.twirl.api.Html("") //views.html.custom.startSignUp(form)(request, lang, env)
    }

    override def getStartResetPasswordPage(form: Form[String])(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      play.twirl.api.Html("") //views.html.custom.startResetPassword(form)(request, lang, env)
    }

    override def getResetPasswordPage(form: Form[(String, String)], token: String)(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      play.twirl.api.Html("") //views.html.custom.resetPassword(form, token)(request, lang, env)
    }

    override def getPasswordChangePage(form: Form[ChangeInfo])(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      play.twirl.api.Html("") //views.html.custom.passwordChanged(form)(request, lang, env)
    }

    def getNotAuthorizedPage(implicit request: RequestHeader, lang: Lang): play.twirl.api.Html = {
      play.twirl.api.Html("") //views.html.securesocial_views.notAuthorized()(request, lang, env)
    }
  }
}
