FROM openjdk:11-jre-slim
EXPOSE 8089

ADD target/5nids2-g9-projet1-1.0.jar 5nids2-g9-projet1-1.0.jar
ENTRYPOINT ["java","-jar","/5nids2-g9-projet1-1.0.jar"]
