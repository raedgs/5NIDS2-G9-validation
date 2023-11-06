FROM openjdk:11-jre-slim
EXPOSE 8089

ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
