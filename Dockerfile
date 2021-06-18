FROM httpd:2.4

## Step 1:
# Create a working directory
WORKDIR /app


## Step 2:
# Copy source code to working directory
COPY . /app/


##RUN echo "Hey"
#RUN apt-get install iptables -y
#RUN iptables -I INPUT -p tcp --dport 12345 --syn -j ACCEPT
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && apt-get install make wget unzip -y && make all
RUN wget -P /var/www/html/ https://github.com/MohamedElAzhary/FinalProject/raw/master/udacity.zip && unzip -o /var/www/html/udacity.zip -d /var/www/html/


## Step 4:
EXPOSE 80
EXPOSE 8000
EXPOSE 8080



## Step 5:
# Run app.py at container launch

CMD ["systemctl start apache2.service"]

