FROM openjdk:11.0.20.1
EXPOSE 8089

ADD target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
