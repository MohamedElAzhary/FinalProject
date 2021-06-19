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
To access the project's website you can use the [Load-Balancer]() DNS Name
