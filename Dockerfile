# syntax=docker/dockerfile:1

######## Build stage ########
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /workspace
COPY pom.xml .
RUN mvn -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q -DskipTests package

######## Run stage ########
FROM eclipse-temurin:21-jre
WORKDIR /app

COPY --from=build /workspace/target/*-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["sh","-c","java -jar /app/app.jar"]
