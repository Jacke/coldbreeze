#!/bin/sh
### BEGIN INIT INFO
# Provides:          playframework
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/Stop playframework
### END INIT INFO
#
#source some script files in order to set and export environmental variables
#as well as add the appropriate executables to $PATH

PLAYFRAMEWORK_HOME='/home/azureuser/minority-core/bp-web/target/universal/stage'
export PIDFILE='/home/azureuser/minority-core/bp-web/target/universal/stage/RUNNING_PID'
USER=azureuser
GROUP=nogroup

case "$1" in
    start)
        echo "Starting playframework"
        START_CMD="${PLAYFRAMEWORK_HOME}/bin/bp-web -Dparam1=value1"
        start-stop-daemon --start -p "${PIDFILE}" --quiet --background --chuid ${USER}:${GROUP} --exec /bin/bash -- ${START_CMD}
        ;;
    stop)
        echo "Stopping playframework"
        start-stop-daemon -K -p "${PIDFILE}" -u "${USER}" -R 30 ;;
      *)
        echo "Usage: /etc/init.d/playframework {start|stop}"
        exit 1
    ;;
esac

exit 0
