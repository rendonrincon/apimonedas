FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTests

from open.jdk:17-jdk-alpine
COPY --from=build /app/presentacion/target/presentacion-0.0.1|-SNAPSHOT.jar app
EXPOSE 8081
CMD ["java",".jar", "app.jar"]



