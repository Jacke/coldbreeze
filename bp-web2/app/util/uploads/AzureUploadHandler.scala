package util

import java.io._
import com.microsoft.azure.storage._
import com.microsoft.azure.storage.blob._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import controllers._

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
   val headers = ""


  def uuid = java.util.UUID.randomUUID.toString

  def upload(fileName: String, workbench: Int, description: String=""):Future[String] = {
    val uuidValue = uuid
    val blob:CloudBlockBlob = container.getBlockBlobReference(s"$fileName+$uuidValue");
    val sourceFile:File = new File(s"bp-web2/tmp_uploads/$fileName");
    var metaData:java.util.HashMap[String,String] = new java.util.HashMap()
    metaData.put("UID", uuidValue)
    //blob.getMetadata().put("UID", uuidValue); //.setMetadata(metaData);
    //blob.uploadMetadata();
    blob.setMetadata(metaData);
    blob.upload(new FileInputStream(sourceFile), sourceFile.length());
    blob.downloadAttributes()
    blob.getMetadata().put("UID", uuidValue);
    blob.uploadMetadata();

    println("file "+sourceFile + " " + sourceFile.length())
    println("blob.getSnapshotID() "+blob.getSnapshotID())

    models.DAO.FilesDAO.pull(models.DAO.File(
                id = None,
                workbench = workbench,
                azureId = uuidValue,
                fileName = fileName,
                description = description,
                external = false,
                externalUrl = None,
                created_at = Some(org.joda.time.DateTime.now() ),
                updated_at = Some(org.joda.time.DateTime.now() )
    ))
    Future.successful("")
  }


  def uploadLaunchFile(fileName: String, workbench: Int, description: String="", launch_id: Int, element_id: Option[Int]):Future[String] = {
    val uuidValue = uuid
    val blob:CloudBlockBlob = container.getBlockBlobReference(s"$fileName+$uuidValue");
    val sourceFile:File = new File(s"bp-web2/tmp_uploads/$fileName");
    var metaData:java.util.HashMap[String,String] = new java.util.HashMap()
    metaData.put("UID", uuidValue)
    //blob.getMetadata().put("UID", uuidValue); //.setMetadata(metaData);
    //blob.uploadMetadata();
    blob.setMetadata(metaData);
    blob.upload(new FileInputStream(sourceFile), sourceFile.length());
    blob.downloadAttributes()
    blob.getMetadata().put("UID", uuidValue);
    blob.uploadMetadata();

    println("file "+sourceFile + " " + sourceFile.length())
    println("blob.getSnapshotID() "+blob.getSnapshotID())

    val fileIdF = models.DAO.FilesDAO.pull(models.DAO.File(
                id = None,
                workbench = workbench,
                azureId = uuidValue,
                fileName = fileName,
                description = description,
                external = false,
                externalUrl = None,
                created_at = Some(org.joda.time.DateTime.now() ),
                updated_at = Some(org.joda.time.DateTime.now() )
    ))
    fileIdF.map { fileId =>
      models.DAO.LaunchFilesDAO.pull(
        models.DAO.LaunchFile(None,
                  fileId = fileId,
                  launch = launch_id,
                  element = element_id,
                  created_at = Some(org.joda.time.DateTime.now() ),
                  updated_at = Some(org.joda.time.DateTime.now()) )
      )
        ""
    }
}

  def getAll():Future[Seq[FileInstance]] = {
    val iterable = container.listBlobs().iterator

    var copy:scala.collection.mutable.ListBuffer[CloudBlockBlob] = new scala.collection.mutable.ListBuffer();
    while (iterable.hasNext()) {
        copy = copy.+:(iterable.next().asInstanceOf[CloudBlockBlob])
    }
    val instances = copy.map { f =>

      val policy = new SharedAccessBlobPolicy
      val perms = java.util.EnumSet.of(SharedAccessBlobPermissions.READ, SharedAccessBlobPermissions.WRITE,
                                 SharedAccessBlobPermissions.LIST, SharedAccessBlobPermissions.DELETE)
      policy.setPermissions(perms)
      val date = new java.util.Date()
      policy.setSharedAccessExpiryTime(new java.util.Date( date.getTime()+(24*60*60*1000) ) )

      f.downloadAttributes()

      var it = f.getMetadata().entrySet().iterator();
      while (it.hasNext()) {
          println(it)
          println(it.next() )
      }
      val prop = f.getProperties()

      println("size: " + prop.getLength() + " " + f.getName() +  " " + prop.getContentType() )
      val metaId = f.getMetadata().get("UID")
      println(metaId)

      FileInstance(metaId, f.getUri().toString()+"?"+f.generateSharedAccessSignature(policy, headers) )
    }

    Future.successful(instances.toSeq)
  }

  def getLinkById(ids: Seq[String],
    files: Seq[models.DAO.File] = Seq() ,
    launchFiles: Seq[models.DAO.LaunchFile] = Seq() ):Future[Seq[FileInstance]] = {
    val iterable = container.listBlobs().iterator

    var copy:scala.collection.mutable.ListBuffer[CloudBlockBlob] = new scala.collection.mutable.ListBuffer();
    while (iterable.hasNext()) {
        val elem = iterable.next().asInstanceOf[CloudBlockBlob]
        elem.downloadAttributes()

        println("UID"+ elem.getMetadata().get("UID"))
        if (ids.contains( elem.getMetadata().get("UID")) ) {
          copy = copy.+:(elem)
        }
    }
    val instances = copy.map { f =>

      val policy = new SharedAccessBlobPolicy
      val perms = java.util.EnumSet.of(SharedAccessBlobPermissions.READ, SharedAccessBlobPermissions.WRITE,
                                 SharedAccessBlobPermissions.LIST, SharedAccessBlobPermissions.DELETE)
      policy.setPermissions(perms)
      val date = new java.util.Date()
      policy.setSharedAccessExpiryTime(new java.util.Date( date.getTime()+(24*60*60*1000) ) )

      f.downloadAttributes()

      var it = f.getMetadata().entrySet().iterator();
      while (it.hasNext()) {
          println(it)
          println(it.next() )
      }
      val prop = f.getProperties()

      println("size: " + prop.getLength() + " " + f.getName() +  " " + prop.getContentType() )
      val metaId = f.getMetadata().get("UID")
      println(metaId)
      val file = files.find(c => c.azureId == metaId)
      val launchFile = file match {
        case Some(file) => launchFiles.find(c => c.fileId == file.id.getOrElse(0L) )
        case _ => None
      }

      FileInstance(f.getName(), f.getUri().toString()+"?"+f.generateSharedAccessSignature(policy, headers), file, launchFile )
    }

    Future.successful(instances.toSeq)
  }



  def removeFileById(fileName: String, id: String): Future[Boolean] = {
    val blob = container.getBlockBlobReference(fileName);
    blob.downloadAttributes()
    val blobId = blob.getMetadata().get("UID")
    if (blobId != null && blobId == id) {
      blob.deleteIfExists();
    }
    Future.successful(true)
  }

}
