package jobs

object DelayedJob {
  // By Duration
  def byDuration() = ???
  // By DateTime
  def byDateTime() = ???


  /* Hooks for */
  // Before delay

  // After delay


}

case class MinorityJob(id: Option[Long], owner: String)

object MinorityJobs {
  var jobs:Seq[MinorityJob] = Seq.empty[MinorityJob]


}