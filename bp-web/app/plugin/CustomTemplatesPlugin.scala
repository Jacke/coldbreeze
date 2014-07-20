package controllers.plugin

import securesocial.controllers._
import play.api.mvc.{Controller, RequestHeader}
import play.api.templates.{Html, Txt}
import securesocial.core.{BasicProfile, RuntimeEnvironment}
import play.api.data.Form
import play.api.i18n.Lang

object ViewTemplates1 {
  /**
   * The default views.
   */
  def Default(env: RuntimeEnvironment[_]) = new Default1(env)
  class Default1(env: RuntimeEnvironment[_]) extends ViewTemplates {
    implicit val implicitEnv = env

    override def getLoginPage(form: Form[(String, String)],
                              msg: Option[String] = None)(implicit request: RequestHeader, lang: Lang): Html = {
      views.html.custom.login(form, msg)(request, lang, env)
    }

    override def getSignUpPage(form: Form[RegistrationInfo], token: String)(implicit request: RequestHeader, lang: Lang): Html = {
      securesocial.views.html.Registration.signUp(form, token)(request, lang, env)
    }

    override def getStartSignUpPage(form: Form[String])(implicit request: RequestHeader, lang: Lang): Html = {
      securesocial.views.html.Registration.startSignUp(form)(request, lang, env)
    }

    override def getStartResetPasswordPage(form: Form[String])(implicit request: RequestHeader, lang: Lang): Html = {
      securesocial.views.html.Registration.startResetPassword(form)(request, lang, env)
    }

    override def getResetPasswordPage(form: Form[(String, String)], token: String)(implicit request: RequestHeader, lang: Lang): Html = {
      securesocial.views.html.Registration.resetPasswordPage(form, token)(request, lang, env)
    }

    override def getPasswordChangePage(form: Form[ChangeInfo])(implicit request: RequestHeader, lang: Lang): Html = {
      securesocial.views.html.passwordChange(form)(request, lang, env)
    }

    def getNotAuthorizedPage(implicit request: RequestHeader, lang: Lang): Html = {
      securesocial.views.html.notAuthorized()(request, lang, env)
    }
  }
}
