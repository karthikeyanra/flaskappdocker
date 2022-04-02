from ubuntu/apache2:latest
RUN apt-get update
RUN apt-get install python3 libapache2-mod-wsgi-py3 python3-pip python3-venv -y
COPY flaskdemo /var/www/flaskdemo
COPY flaskdemo.conf /etc/apache2/sites-enabled/000-default.conf
SHELL ["/bin/bash", "-c"]
RUN python3 -m venv /var/www/flaskdemo/venv 
WORKDIR /var/www/flaskdemo 
RUN source venv/bin/activate && pip3 install -r requirments.txt
RUN apachectl graceful 
