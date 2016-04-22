package util

import java.io._
import com.microsoft.azure.storage._
import com.microsoft.azure.storage.blob._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

object AzureUploadHandler {
  def apply():AzureUploadHandler = {
    new AzureUploadHandler()
  }
}

class AzureUploadHandler extends FileHandler {
  val storageConnectionString =
            "DefaultEndpointsProtocol=http;AccountName=minorityapp;AccountKey=NLCwa9mvTfcPg9suqDwycxCHaMYLLCj5eJWm1wtH0ZYoiOz5nEzlDxv2iUdVz8xXa6Xo+Bu+M1Rj5ninbcV35g==";

  val account = CloudStorageAccount.parse(storageConnectionString);
  val serviceClient = account.createCloudBlobClient();

  // Container name must be lower case.
  val container = serviceClient.getContainerReference("minority-uploads");
  container.createIfNotExists();

  val policy = new SharedAccessBlobPolicy

  // blob = obj.asInstanceOf[CloudBlob]
  // val headers = ""
  // val policy = new SharedAccessBlobPolicy
  // val perms = java.util.EnumSet.of(SharedAccessBlobPermissions.READ, SharedAccessBlobPermissions.WRITE,
//                              SharedAccessBlobPermissions.LIST, SharedAccessBlobPermissions.DELETE)
  // policy.setPermissions(perms)
  // policy.setSharedAccessExpiryTime(new java.util.Date())
  // blob.generateSharedAccessSignature(policy, headers)



  def upload():Future[String] = Future.successful("")
  def getLinkById(id: String):Future[String] = Future.successful("")
  def removeFileById(id: String): Future[Boolean] = Future.successful(true)

}
