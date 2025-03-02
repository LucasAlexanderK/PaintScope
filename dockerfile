FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

# Copy gradle files
COPY gradlew .
COPY gradle gradle
COPY build.gradle.kts  .
COPY settings.gradle.kts .
COPY src src

# Build the application
RUN chmod +x ./gradlew
RUN ./gradlew bootJar -x test

# Create the final image
FROM eclipse-temurin:17-jre-alpine
VOLUME /tmp
COPY --from=build /workspace/app/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]