# Use Eclipse Temurin (OpenJDK) Java 17 base image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR into the container
COPY target/demo-workshop-2.0.2.jar app.jar

# Expose port (change 8080 if your app runs on another port)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
