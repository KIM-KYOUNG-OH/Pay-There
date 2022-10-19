# syntax=docker/dockerfile:1

FROM openjdk:11

EXPOSE 8080

ADD build/libs/payThere-0.0.1-SNAPSHOT.jar payThere.jar

ENTRYPOINT ["java", "-jar", "payThere.jar"]