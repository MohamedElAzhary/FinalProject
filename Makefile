## The Makefile includes instructions on environment setup and lint tests
installBase:
		apt-get update && apt-get install make wget unzip awscli -y
		DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
		apt-get install apache2 -y
		@wget -O /usr/bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 \
		&& chmod +x /usr/bin/hadolint
		@wget -O /usr/bin/kubectl "https://dl.k8s.io/release/v1.21.1/bin/linux/amd64/kubectl" \
		&& chmod +x /usr/bin/kubectl
		@wget -O /usr/bin/minikube "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64" \
		&& chmod +x /usr/bin/minikube
		#@wget -P /usr/bin/tempor https://download.docker.com/linux/static/stable/x86_64/docker-17.03.0-ce.tgz
		#@tar -xzvf /usr/bin/tempor/docker-17.03.0-ce.tgz -C /usr/bin/tempor \
		#&& chmod +x /usr/bin/tempor/docker/*
		#mv /usr/bin/tempor/docker/* /usr/bin/
		echo "Base Dependencies successfully installed"

lint:
		hadolint --ignore DL3013 --ignore DL3008 --ignore DL3009 --ignore DL3013 --ignore DL3015 Dockerfile && echo "Docker successfully linted"

deploy:
		echo "Deploying"
		sudo iptables -I INPUT -p tcp --dport 12345 --syn -j ACCEPT
	    sudo touch /etc/network/iptables.rules && \
	    sudo chmod 777 /etc/network/iptables.rules
	    sudo iptables-save > /etc/network/iptables.rules
		sudo chmod 755 /etc/network/iptables.rules
		sudo wget -P /var/www/html/ https://github.com/MohamedElAzhary/FinalProject/raw/master/udacity.zip
		sudo unzip -o /var/www/html/udacity.zip -d /var/www/html/ && echo "Website files successfully installed"

all: installBase lint deploy
