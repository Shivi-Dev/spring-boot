# FROM ubuntu:latest AS build

# RUN apt-get update
# RUN apt-get install openjdk-17-jdk-alpine-with-timezone -y
# COPY . .

# RUN ./mvnw spring-boot:run

# FROM openjdk:17-jdk-alpine-with-timezone

# EXPOSE 8080

# COPY --from=build /build/libs/URLShortener.jar app.jar

# ENTRYPOINT ["java", "-jar", "app.jar"]

# Fetching latest version of Java
FROM openjdk:17
 
# Setting up work directory
WORKDIR /src

# Copy the jar file into our app
COPY ./target/URLShortener-0.0.1-SNAPSHOT.jar /app

# Exposing port 8080
EXPOSE 8080

# Starting the application
CMD ["java", "-jar", "spring-0.0.1-SNAPSHOT.jar"]