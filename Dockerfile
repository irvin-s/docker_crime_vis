#This dockerfile is used to build a Docker image for Crimevis project.
# It installs Python and the necessary dependencies.

#Base image for python
FROM python:3.11-slim-bullseye

#Install necessary Apache http, git, and DuckDB dependencies
RUN apt update
RUN apt install -y apache2
RUN apt install -y git
#RUN curl https://install.duckdb.org | sh

#Cloning the git repository for Crimevis
RUN git clone https://github.com/irvin-s/crime_occur_vis.git /tmp/crime_vis

#Move the contents to the Apache http folder
RUN mv /tmp/crime_vis/* /var/www/html/

#Install Python dependencies
RUN pip install --no-cache-dir -r /var/www/html/requirements.txt

#Work directory for the application
WORKDIR /var/www/html/api/

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

#Expose port 80 for http and 8000 for Gunicorn
EXPOSE 80
EXPOSE 8000

# Start both services
CMD ["/start.sh"]