FROM maven:3.9-eclipse-temurin-21 As Build
WORKDIR /build
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn package -DskipTests
#image for production
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=Build /build/target/*.jar app.jar
RUN adduser --disabled-password appuser
USER appuser
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]