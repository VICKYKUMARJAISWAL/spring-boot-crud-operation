# Use an official Java runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY /mnt/c/Users/VickyKumarjaiswal/Documents/GitHub/restapidemo/spring-boot-crud-operation/target/spring-boot-crud-operation-0.0.1-SNAPSHOT.jar /app/

# Make port 8080 available to the world outside the container
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/springboot-crud-operation.jar"]
