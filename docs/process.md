# Process Description
![Image of cicd](https://www.sparkpost.com/wp-content/uploads/2017/01/Dev-Ops_800x300-01.png)
## 1. Source code preparation
- fork from repository https://github.com/wojciech11/se_hello_printer_app
- aplication cloning to our git repository
- installing and running application using the README guide

## 2. Single Project Entry point
- creating a Makefile to automate the most frequently used commands

## 3. Continuous Integration with TravisCI
- adding to repository file .travis.yml
- registration on travis-ci.com
- running tests with travisCi

## 4. Project building with Docker package
- creating Docker file
- building the package
- using TravisCi to build Docker

## 5. Continuous Deployment with TravisCI
- package instalation to the repository shared with customer
- registration on : https://hub.docker.com
- adding docker image to the repository
- automation of login proces by adding to Makefile hub.docker username and adding password to TravisCI Settings
- pushing to git and checking if docker image was built correctly
- stimulating deployment by downloading docker image from https://hub.docker.com instead of local image

## 6. Smoke test
- adding to Makefile simple smoke test

## 7. Expanding our application
- adding XML support in our application
- the possibility of providing user’s first name in the argument
- creating JSON and xml using appropriate libraries
- improving formater tests

## 8. Deployment to Heroku from dev machine
- creating account on heroku.com
- adding gunicorn to requirements file
- installing Heroku CLI
- putting the application on Heroku platform

## 9. Deployment to Heroku from TravisCI
- adding app name and app key to .travis.yml

## 10. Monitoring using Statuscake
- creating account on statuscake.com
- adding Uptime Monitoring test to our application

## 11. Adding badge StatusCake  and TravisCI in README.md

## 12. Test coverage info
- extending requirements file by adding pytest-cov
- adding junit file

![Image of mona-the-rivetertocat](https://octodex.github.com/images/mona-the-rivetertocat.png)
