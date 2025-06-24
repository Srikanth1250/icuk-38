# First stage: build the application
RUN chmod +x mvnw && ./mvnw package -DskipTests
WORKDIR /app

# Copy source code and build using Maven or Gradle
COPY . .
RUN ./mvnw package -DskipTests

# Second stage: run the application
from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]

COPY --from=build /app/target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
