FROM maven:3.8.3-openjdk-11-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
COPY --from=build /app/target/service-registry-0.0.1-SNAPSHOT.jar /service-registry-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/service-registry-0.0.1-SNAPSHOT.jar"]

#docker run -p 8080:8761 --name myapp-container service-registry