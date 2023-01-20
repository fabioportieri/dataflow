curl https://raw.githubusercontent.com/spring-cloud/spring-cloud-dataflow/main/src/docker-compose/docker-compose.yml -o docker-compose.yml
curl https://raw.githubusercontent.com/spring-cloud/spring-cloud-dataflow/main/src/docker-compose/docker-compose-kafka.yml -o docker-compose-kafka.yml
curl https://raw.githubusercontent.com/spring-cloud/spring-cloud-dataflow/main/src/docker-compose/docker-compose-postgres.yml -o docker-compose-postgres.yml

curl https://raw.githubusercontent.com/spring-cloud/spring-cloud-dataflow/main/src/docker-compose/docker-compose-prometheus.yml -o docker-compose-prometheus.yml
:


http://localhost:9393/dashboard -- dashboard dataflow

http://localhost:3000  -- dashboard grafana


maven://<groupId>:<artifactId>:<version>
maven://it.dmi.fascicolopersonale:fdp-documentale-batch:0.0.1-SNAPSHOT

maven://it.dmi.fascicolopersonale:fdp-documentale-batch:jar:metadata:0.0.1-SNAPSHOT

dataflow:>app register --name log --type sink
    --uri maven://org.springframework.cloud.stream.app:log-sink:3.2.1
    --metadata-uri maven://org.springframework.cloud.stream.app:log-sink:jar:metadata:3.2.1



https://docs.spring.io/spring-cloud-dataflow/docs/current/reference/htmlsingle/#configuration


https://github.com/spring-cloud/spring-cloud-dataflow-samples/blob/main/batch/file-ingest/src/main/java/io/spring/cloud/dataflow/ingest/config/BatchConfiguration.java


https://stackoverflow.com/questions/62887534/how-to-properly-compile-package-a-task-for-spring-cloud-data-flow/68601723#68601723

--------------

https://docs.spring.io/spring-cloud-dataflow-samples/docs/current/reference/htmlsingle/#_http_to_mysql_demo

3.2. HTTP to MySQL Demo

in questo esempio i prerequisiti sono un istanza docker kafka (OK) e un istanza mysql (aggiungere, oltre alla postgres)

1. registra kafka binder: app import --uri https://dataflow.spring.io/kafka-maven-latest

2. crea stream:
stream create --name mysqlstream --definition "http --server.port=8787 | jdbc --tableName=names --columns=name --spring.datasource.driver-class-name=org.mariadb.jdbc.Driver 
--spring.datasource.url='jdbc:mysql://localhost:3306/test'" --deploy

3. fai chiamata post:
http post --contentType 'application/json' --target http://localhost:8787 --data "{\"name\": \"Foo\"}"

> POST (application/json;charset=UTF-8) http://localhost:8787 {"name": "Spring Boot"}
> 202 ACCEPTED

4. connettiti all istanza mysql: select * from test.names;



PROBLEMI
- errore sul taskexecutionid, perche' il batch usa un db diverso da quello usato dal dataflow, dovranno essere in sync FATTO

- come prevalorizzare le properties di un task?
pass grafana: admin admin


stream create --definition "http --port 20100 | log" --name httpingest
