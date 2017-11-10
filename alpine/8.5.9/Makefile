build:
	docker build -t kutuni/tomcat:8.5-alpine --rm=true .

shell:
	docker run -it --entrypoint=bash --rm kutuni/tomcat:8.5-alpine

start:
	docker run --name tomcat8-1 \
		-v /etc/timezone:/etc/timezone:ro \
		-v /etc/localtime:/etc/localtime:ro \
		--restart=always \
        -v $(PWD)/logs:/tomcat/logs \
        -v $(PWD)/conf:/tomcat/conf \
        -v $(PWD)/webapps:/tomcat/webapps \
        -e JAVA_OPTS='-server -Dspring.profiles.active=pg -Duser.timezone=GMT+3 -Djava.awt.headless=true -Xms256m -Xmx1g' \
        --net="host" \
        -d kutuni/tomcat:8.5-alpine

clean:
	docker rm -f tomcat8-1
