#This dockerfile is used to build a Docker image for Crimevis project.
# It installs Python and the necessary dependencies.

#Base image for python
FROM python:3.11-slim-bullseye

#Cloning the git repository for Crimevis
RUN apt update && apt-get install -y git
RUN git clone https://github.com/irvin-s/crime_occur_vis.git

#Setting the http server for static pages
RUN apt install -y apache2
EXPOSE 8080

#Starting the database
RUN curl https://install.duckdb.org | sh

#Setting the api server for python application
