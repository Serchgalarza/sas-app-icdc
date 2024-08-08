
# Alpine Linux avec OpenJDK JRE
FROM openjdk:8-jre-alpine

# Copie le fiche war 
COPY users-0.0.1-SNAPSHOT.jar /users.war

# run l'app
CMD ["/usr/bin/java", "-jar", "/users.war"]