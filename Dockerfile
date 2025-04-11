# Use OpenJDK 21 as base image
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the Maven configuration file
COPY pom.xml .

# Copy the source code
COPY src ./src

# Copy the Maven wrapper
COPY .mvn .mvn
COPY mvnw .

# Make the Maven wrapper executable
RUN chmod +x mvnw

# Build the application
RUN ./mvnw clean package -DskipTests

# Create uploads directory
RUN mkdir -p uploads

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/forum-0.0.1-SNAPSHOT.jar"]