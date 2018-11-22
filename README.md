# README

This README would normally document whatever steps are necessary to get the
application up and running.

Make sure you have docker and docker-compose in your local PC.

How to start this application using docker-compose:

* Clone this repository to your local

* Open the project directory on your favorite text editor

* Build docker image using: docker-compose build

* Create Database: docker-compose run app rails db:create

* Do migration for changed in database schema: docker-compose run app rails db:migrate

* Run tax_calculator rails api application by using this command: docker-compose up

* Go to http://localhost:3003/ and make sure you got the default rails application welcome page

