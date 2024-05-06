FROM openjdk:17
WORKDIR /UniversitySB
EXPOSE 8080
ADD target/UniversitySB-0.0.1-SNAPSHOT.jar UniversitySB-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "UniversitySB-0.0.1-SNAPSHOT.jar"]
