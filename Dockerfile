#This dockerfile is used to build a Docker image for Crimevis project.
# It installs Python and the necessary dependencies.

#Base image for python
FROM python:3.11-slim-bullseye

#Install necessary Apache http, git, and DuckDB dependencies
RUN apt update
RUN apt install -y apache2
RUN apt install -y git
RUN curl https://install.duckdb.org | sh

#Cloning the git repository for Crimevis
RUN git clone https://github.com/irvin-s/crime_occur_vis.git /tmp/crime_vis

#Move the contents to the Apache http folder
RUN mv /tmp/crime_vis/* /var/www/html/

#Expose port 80 for Apache
EXPOSE 80

#Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
