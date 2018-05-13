package models


import anorm._
import anorm.SqlParser._

import com.github.t3hnar.bcrypt._
import java.util.Date

case class User(id: Option[Long], email: String, name: String, password: String, token: String, token_created: Date)


object User {
/*
  val simple = {
    get[Pk[Long]]("user.id") ~
    get[String]("user.email") ~
    get[String]("user.name") ~
    get[String]("user.password") ~
    get[String]("user.token") ~ 
    get[Date]("user.token_created") map {
      case id~email~name~password~token~token_created => User(id, email, name, password,token,token_created)
    }
  }

  def findByEmail(email: String): Option[User] = {
    DB.withConnection { implicit connection =>
      SQL("select * from user where email = {email}").on(
        "email" -> email
      ).as(User.simple.singleOpt)
    }
  }
  def findByToken(token: String): Option[User] = {
    DB.withConnection { implicit connection =>
      SQL("select * from user where token = {token}").on(
        "token" -> token
      ).as(User.simple.singleOpt)
    }
  }
 

  def create(email: String, name: String, password: String): Either[String, User] = {
    findByEmail(email) match {
      case Some(_) => Left("The email has been used.")
      case None => {
        DB.withConnection { implicit connection =>
          val id: Long = SQL("select next value for user_seq").as(scalar[Long].single)
          val hashed = password.bcrypt(generateSalt)

          SQL(
            """
	      insert into user values (
	        {id}, {email}, {name}, {password}, {token}, {token_created}
	      )
	    """
          ).on(
            "id" -> id,
            "email" -> email,
	          "name" -> name,
	          "password" -> hashed,
            "token" -> "",
            "token_created" -> new Date
          ).executeUpdate()

          Right(User(Id(id), email, name, hashed, "", new Date))
        }
      }
    }
  }

  def createToken(email: String): Either[String, Token] = {
    findByEmail(email) match {
      case None => Left("The email has been used.")
      case Some(user) => {
        DB.withConnection { implicit connection =>
          val id = java.util.UUID.randomUUID().toString();
          val token_created = new Date
          val token = Token(id, "", "api", token_created)

          SQL(
            """
        UPDATE user set 
        token = {token}, 
        token_created = {token_created}
        
        WHERE email = {email}
      """
          ).on(
            'email -> email,
            'token -> token.token,
            'token_created -> token.created
          ).executeUpdate

          Right(Token(id, "", "api", token_created))
        }
      }
    }
  }

  def authenticate(email: String, password: String): Option[User] = {
    DB.withConnection { implicit connection =>
      SQL(
        """
	  select * from user where
	  email = {email}
	"""
      ).on(
        "email" -> email
      ).as(User.simple.singleOpt) match {
        case Some(user) => {
          if (password.isBcrypted(user.password)) {
            Some(user)
          } else {
            None
          }
	}
	case None => None
      }
    }
  }

  def update(email: String, name: String, password: String): Either[String, User] = {
    findByEmail(email) match {
      case None => Left("The email has been used.")
      case Some(user) => {
        DB.withConnection { implicit connection =>
          val hashed = password.bcrypt(generateSalt)

          SQL(
            """
	      update user set name = {name}, password = {password}
	      where id = {id} and email = {email}
	    """
          ).on((
            "id" -> user.id,
            "email" -> email,
	    "name" -> name,
	    "password" -> hashed
          ).asInstanceOf[NamedParameter]).executeUpdate()

          Right(User(user.id, email, name, hashed, "", new Date))
        }
      }
    }
  }
  */
}

