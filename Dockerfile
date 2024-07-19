FROM openjdk:17-jdk
WORKDIR /app

COPY mvnw .
COPY .mvn .mvn

COPY pom.xml .
RUN ./mvnw dependency:go-offline -B

COPY src ./src

RUN ./mvnw package -DskipTests

CMD ["java", "-jar", "target/spring-petclinic-3.3.0-SNAPSHOT.jar"]
