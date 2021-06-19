<p align="left">
  <img src="https://github.com/MohamedElAzhary/FinalProject/blob/master/mbr-122x122.jpg?raw=true" width="80" title="my_photo">
</p>

 [![MohamedElAzhary](https://circleci.com/gh/MohamedElAzhary/FinalProject.svg?style=svg)](https://app.circleci.com/pipelines/github/MohamedElAzhary/FinalProject)

### Final Project README file 

#### Project Brief
This project is about hosting a website on an apache server using
the Blue-Green deployment strategy.
This project involves the following,
- [x] Creating [Github](https://github.com/MohamedElAzhary/FinalProject/) repository with project code.
- [x] Building a [Docker image](https://github.com/MohamedElAzhary/FinalProject/blob/master/Repo%20Building.PNG?raw=true) of the apache server hosting the website.
- [x] Use [DockerHub](https://hub.docker.com/r/moazario/siteimage) image repository to store Docker images.
- [x] Dockerfile is linted [successfully](https://github.com/MohamedElAzhary/FinalProject/blob/master/lint%20successfully.PNG?raw=true) using Hadolint on CircleCI.
- [x] [Blue-Green](https://github.com/MohamedElAzhary/FinalProject/blob/master/bluegreen.PNG?raw=true) deployment is done using Cloudformation script.
- [x] Docker container is [deployed successfully](https://github.com/MohamedElAzhary/FinalProject/blob/master/Pod%20working.PNG?raw=true) to Kubernetes cluster.
- [x] Apache server is [repsonding](https://github.com/MohamedElAzhary/FinalProject/blob/master/WGET%20response.PNG?raw=true) with website html files.

### Access Project's website
To access the project's website you can use the [Load-Balancer](http://P5loadbalancer-eaf570b874557611.elb.us-west-2.amazonaws.com) DNS Name

### Traffic to Servers
Clients send requests to the Load Balancer which will forward the incoming traffic to the Blue server.
In case modifications were down to source code in the repo, after commiting and pushing to the repo,
by running bluegreen.sh script as per the below steps, a new green server is started and registered at
the target group of the load-balancer while the blue server gets deregisted from the load balancer target
group, then the load-balancer redirects the incoming traffic to the green server which gets tagged as blue
when it starts serving clients requests, this will achieve high operability and availability.

### Steps to deploy infrastructure
- Create the basic infrastructure {Security Groups, Load-Balancer, VPC, ... etc.}

   ```bash create_infra.sh```

- Deploy a new server {Green}

  ```bash bluegreen.sh```
