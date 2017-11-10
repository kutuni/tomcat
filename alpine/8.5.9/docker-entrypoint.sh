#!/bin/bash
set -e

umask 0000

# preferable to fire up Tomcat via start-tomcat.sh which will start Tomcat with
# security manager, but inheriting containers can also start Tomcat via
# catalina.sh

if [ "$1" = '/run' ]; then

    # look for empty dir
    if [ "$(ls -A /tomcat/conf)" ]; then
         echo "config files found.."
    else
        echo "/conf is Empty. Config files copying from docker"
        cp /tomcat/conf.original/* /tomcat/conf/
    fi

    ###
    # Change CATALINA_HOME ownership to tomcat user and tomcat group
    # Restrict permissions on conf
    ###

    #chown -R tomcat:tomcat ${CATALINA_HOME}
    #chmod 666 ${CATALINA_HOME}/
    #chmod 777 ${CATALINA_HOME}/conf
    #chmod 777 ${CATALINA_HOME}/logs
    #chmod 777 ${CATALINA_HOME}/temp
    #mkdir -p ${CATALINA_HOME}/conf/Catalina/localhost
    #chmod +x ${CATALINA_HOME}/conf/Catalina
    #chmod +x ${CATALINA_HOME}/webapps
    #chmod +x ${CATALINA_HOME}/conf/Catalina/localhost

    sync
#    exec gosu tomcat "$@"
    exec "$@"
fi

exec "$@"
