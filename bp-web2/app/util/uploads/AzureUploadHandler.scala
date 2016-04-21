package util

import java.io._
import com.microsoft.azure.storage._
import com.microsoft.azure.storage.blob._


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






}
