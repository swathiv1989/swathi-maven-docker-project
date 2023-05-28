FROM openjdk:8
ADD target/swathi-maven-docker-project.jar swathi-maven-docker-project.jar
ENTRYPOINT ["java", "-jar","swathi-maven-docker-project.jar"]
EXPOSE 8080
