node default {
}

#node 'ip-172-31-36-145.eu-central-1.compute.internal'{
	#include role::master_server
	#include role::central_configuration_server
#}
node /^web/ {
	include role::app_server
}
node /^db/ {
	include role::db_server
}
