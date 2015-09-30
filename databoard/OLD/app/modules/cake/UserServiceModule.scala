package modules.cake
import models.services._
/**
 * Provides the user service
 */
trait UserServiceModule {
  lazy val userService = new UserServiceInMemory
}
