FROM openjdk:11 AS  build 
WORKDIR /app
COPY . .
RUN apt update 
RUN apt upgrade -y 
RUN apt install maven -y 

RUN mvn clean install

# Use the official Apache Tomcat base image
FROM tomcat:latest

# Remove existing sample applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the Tomcat webapps directory
COPY --from=build /app/target/exceldata.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for the Tomcat server
EXPOSE 8080

# Start the Tomcat server when the container is run
CMD ["catalina.sh", "run"]

