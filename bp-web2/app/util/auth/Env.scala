package utils.auth

import com.mohiva.play.silhouette.api.Env
import com.mohiva.play.silhouette.impl.authenticators.CookieAuthenticator
import models.User2

/**
 * The default env.
 */
trait DefaultEnv extends Env {
  type I = User2
  type A = CookieAuthenticator
}