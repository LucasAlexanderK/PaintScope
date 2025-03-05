# Use an appropriate base image with Java and necessary build tools
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Gradle wrapper and set executable permission
COPY gradlew . 
COPY gradle gradle 
RUN chmod +x gradlew

# Copy the rest of the project
COPY . .

# Ensure gradlew has execution permissions before running it
RUN ls -l gradlew  # Debugging: Check if it's executable
RUN chmod +x gradlew
RUN ./gradlew clean bootJar

RUN cp build/libs/*.jar app.jar

# Specify the command to run your application
ENTRYPOINT ["java", "-jar", "app.jar"]
