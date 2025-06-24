# Use modern lightweight Java 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set work directory
WORKDIR /app

# Copy the jar into image
COPY target/oms-order-service-0.0.1-SNAPSHOT.jar app.jar

# Expose port (your app listens on 9093)
EXPOSE 9093

# Run the app
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
