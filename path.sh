port=$1
#echo $1
# Get the PID of the process listening on the specified port
pid=$(lsof -ti :$port)

# Check if PID is empty
#if [[ -z "$pid" ]]
#then
#  echo "No process is listening on the port: $port"
#  exit 1
#fi

# Find the Tomcat process
tomcat_process=$(ps -ef | grep $pid | grep -v grep | grep java)

# Check if the Tomcat process was found
#if [[ -z "$tomcat_process" ]]
#then
#  echo "No Tomcat process found with PID: $pid"
#  exit 1
#fi

# Get the path of the Tomcat process
tomcat_path=$(echo $tomcat_process | awk -F'-Dcatalina.base=' '{print $2}' | awk '{print $1}')

# Check if the Tomcat path was found
#if [[ -z "$tomcat_path" ]]
#then
#  echo "No Tomcat configuration path found for the process with PID: $pid"
#  exit 1
#fi

echo "$tomcat_path/conf/web.xml"
