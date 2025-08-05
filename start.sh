#!/bin/bash
# Start Gunicorn in background
gunicorn -w 4 -b 0.0.0.0:8000 routes:app &
# Start Apache in foreground
apachectl -D FOREGROUND