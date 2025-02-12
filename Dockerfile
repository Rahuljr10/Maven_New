# Use the official Tomcat image as the base image
FROM tomcat:9.0

# Copy the WAR file from the target directory to the Tomcat webapps directory
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
