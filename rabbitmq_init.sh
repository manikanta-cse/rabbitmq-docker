export RABBITMQ_PID_FILE=/var/run/rabbitmq/pid

# Start the service for configuration purposes and wait until it is running
service rabbitmq-server start
rabbitmqctl wait /var/run/rabbitmq/pid

# Install the RabbitMQ Management plugin
rabbitmq-plugins enable rabbitmq_management

# Put RabbitMQ Initialization Commands Here
# Admin user
rabbitmqctl add_user admin admin
rabbitmqctl set_user_tags admin administrator
# Guest user
rabbitmqctl add_user user1 user1
rabbitmqctl add_vhost dummy-services

rabbitmqctl set_permissions -p dummy-services admin ".*" ".*" ".*"
rabbitmqctl set_permissions -p dummy-services user1 ".*" ".*" ".*"

echo "*** User 'admin & user1' with password 'admin & user1' completed. ***" 
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***"

# Stop the service
service rabbitmq-server stop

# Start the server for real in a way that will keep the container alive
exec rabbitmq-server
