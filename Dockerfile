# Stage 1: Build the application
FROM eclipse-temurin:17-jdk AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Build the application using Maven Wrapper
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
