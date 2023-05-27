FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk-alpine-with-timezone -y
COPY . .

RUN ./mvnw spring-boot:run

FROM openjdk-17-jdk-alpine-with-timezone

EXPOSE 8080

COPY --from=build /build/libs/URLShortener.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]