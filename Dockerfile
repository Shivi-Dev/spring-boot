FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN ./mvnw spring-boot:run

FROM openjdk:17-jdk-slim

EXPOSE 8080

COPY --from=target /build/libs/URLShortener.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]