# First stage: build the application
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app

# Copy source code and build using Maven or Gradle
COPY . .
RUN ./mvnw package -DskipTests

# Second stage: run the application
FROM eclipse-temurin:17-jdk
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
