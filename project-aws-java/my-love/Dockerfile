FROM amazoncorretto:17-alpine

# Copy the jar file into the image
COPY target/my-love-1.0.jar /app/my-love-1.0.jar

# Expose the port the app runs on
EXPOSE 8080

# Set the working directory and default command
WORKDIR /app
ENTRYPOINT ["java", "-jar", "my-love-1.0.jar"]