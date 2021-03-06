FROM httpd:2.4
#FROM ubuntu:16.04

## Step 1:
# Create a working directory
#WORKDIR ss/var/www/html/


## Step 2:
# Copy source code to working directory
COPY ./udacity/ /usr/local/apache2/htdocs/


##RUN echo "Hey"
#RUN apt-get install iptables -y
#RUN iptables -I INPUT -p tcp --dport 12345 --syn -j ACCEPT
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get update && apt-get install make wget unzip apache2 --no-install-recommends -y
RUN wget --no-check-certificate -P /var/www/html/ https://github.com/MohamedElAzhary/FinalProject/raw/master/udacity.zip && \
    unzip -o /var/www/html/udacity.zip -d /var/www/html/
#RUN systemctl start apache2.service

#RUN wget -P /var/www/html/ https://github.com/MohamedElAzhary/FinalProject/raw/master/udacity.zip && unzip -o /var/www/html/udacity.zip -d /var/www/html/
#RUN cp -r /var/www/html/udacity/* /var/www/html/


## Step 4:
EXPOSE 80
EXPOSE 8000
EXPOSE 8080