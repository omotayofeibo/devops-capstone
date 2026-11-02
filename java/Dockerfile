# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY omotayo.jpg /app/omotayo.jpg

COPY --from=build /app/target/yearbook-lambda-1.0.0.jar app.jar

EXPOSE 8081

CMD ["java", "--add-modules", "jdk.httpserver", "-cp", "app.jar", "Application"]
