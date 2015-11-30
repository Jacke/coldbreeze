sudo apt-get install jq


LAST_NUM=`curl -H "Accept: application/json" 'https://circleci.com/api/v1/project/Jacke/coldbreeze/tree/master?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563' | jq '.[0].build_num'`

FUTURE_NUM=$(($LAST_NUM + 1))

echo "OLD NUMBER"
echo $FUTURE_NUM
# MAKE ANOTHER BUILD
echo "MAKE ANOTHER BUILD"
CALL=`curl -X POST -H "Accept: application/json" "https://circleci.com/api/v1/project/Jacke/coldbreeze/${LAST_NUM}/ssh?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563" | jq '.build_num'`
echo $CALL
echo "NEW NUMBER"
# loop before node catched

echo "loop before node catched"

CALCULATED=20
while [  $CALCULATED -ge 10 ]; do
  #touch pic-`date +%s`.jpg
  # CHECK INFO
  echo $LAST_NUM  
echo "https://circleci.com/api/v1/project/Jacke/coldbreeze/${LAST_NUM}?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563"
  echo `curl -X GET -H "Accept: application/json" "https://circleci.com/api/v1/project/Jacke/coldbreeze/${LAST_NUM}?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563"`

CALL_DESC=`curl -X GET -H "Accept: application/json" "https://circleci.com/api/v1/project/Jacke/coldbreeze/${CALL}?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563" | jq '.node'`
  if [ "$CALL_DESC" != "null" ]; then
   CALCULATED=10;
   IP=`curl -X GET -H "Accept: application/json" "https://circleci.com/api/v1/project/Jacke/coldbreeze/${CALL}?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563" | jq '.node[].public_ip_addr'`
   PORT=`curl -X GET -H "Accept: application/json" "https://circleci.com/api/v1/project/Jacke/coldbreeze/${CALL}?circle-token=11524eb16382f01f7a48834f6336eac7f95f4563" | jq '.node[].port'`
   echo $CALL_DESC
   NEW_IP=`echo $IP | sed "s/\"//g"`
   echo " "
   echo "ssh -p ${PORT} ubuntu@${NEW_IP} -L 5901:localhost:5901 &"
   echo "vnc4server -geometry 1280x1024 -depth 24"
   `../noVNC/utils/launch.sh --listen 8080 --vnc localhost:5901`
   echo "GO TO http://bority1.cloudapp.net:8080/vnc.html?host=bority1.cloudapp.net?port=8080"
  else 
  sleep 200
  fi
done
