# Start with a lightweight OpenJDK 17 base image
FROM eclipse-temurin:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR into the container
COPY target/demo-workshop-2.0.2.jar app.jar

# Expose the port your app runs on (typically 8080)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
