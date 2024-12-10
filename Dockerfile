FROM tomcat:8-jre11
LABEL project="vprofile"
LABEL author="ahmed mohsen"
# Remove the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the build context to the Tomcat webapps directory
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the Tomcat port
EXPOSE 8080