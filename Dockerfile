# # FROM ubuntu:latest AS build

# # RUN apt-get update
# # RUN apt-get install openjdk-17-jdk-alpine-with-timezone -y
# # COPY . .

# # RUN ./mvnw spring-boot:run

# # FROM openjdk:17-jdk-alpine-with-timezone

# # EXPOSE 8080

# # COPY --from=build /build/libs/URLShortener.jar app.jar

# # ENTRYPOINT ["java", "-jar", "app.jar"]

# # Fetching latest version of Java
# FROM openjdk:17
 
# # Setting up work directory
# WORKDIR /src

# # Copy the jar file into our app
# COPY ./target/URLShortener-0.0.1-SNAPSHOT.jar /app

# # Exposing port 8080
# EXPOSE 8080

# # Starting the application
# CMD ["java", "-jar", "spring-0.0.1-SNAPSHOT.jar"]


# AS <NAME> to name this stage as maven
FROM maven:3.6.3 AS maven

WORKDIR /usr/src/app
COPY . /usr/src/
# Compile and package the application to an executable JAR
RUN mvn package 

# For Java 11, 
FROM khipu/openjdk17-alpine

ARG JAR_FILE=URLShortener-0.0.1-SNAPSHOT.jar

WORKDIR /opt/app

# Copy the URLShortener-0.0.1-SNAPSHOT.jar from the maven stage to the /opt/app directory of the current stage.
COPY --from=maven /usr/src/app/target/${JAR_FILE} /opt/app/

ENTRYPOINT ["java","-jar","URLShortener-0.0.1-SNAPSHOT.jar"]