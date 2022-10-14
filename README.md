# README

## Introduction ##

ESGMemTrack is designed to store an attendance sheet based on a list of members and events for the organization Eta Sigma Gamma. Members are added to the roster by signing up, and events are created by an admin of ESG. Attendance is noted by the time the member signs up so that they can see that they are on time.

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.4.1
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.4
* Dockerversion 20.10.17
* Heroku
* RuboCop
* Simplecov
* Brakeman


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/rjbilledo/ESGMemTrack.git


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/feature/integration_spec.rb`
  `rspec spec/feature/unit_spec.rb`
  or
  `rspec spec`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd ESGMemTrack`

  `docker run --rm -it --volume "$(pwd):/ESGMemTrack" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  `cd ESG_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && db:migrate`

Run the app
  `rails server --binding:0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/

## Environmental Variables/Files ##

Members will sign in to the application using google's login system. You will then be able to check the list of events and select the "Join this Event" button next to the events you will be attending. As an Admin, you will be able to select an event to check attendance, select "Create a New Event" to make a new event, or join events in the same manner as other members.

## Deployment ##

Deployment should be automatically set for the test branch to deploy when it is updated on Github. Once the test is merged with main, it should be automatically deployed to the production app. This can also be done manually through the Heroku GUI, which is currently owned by Allison. Click on the production app, then click on Deploy, then choose the branch to deploy, then click deploy branch.


## CI/CD ##

CI/CD is done through Heroku, which is continuously updating the servers based on what has been pushed. Rubocop and Brakeman are also being used to help with this.

## Support ##

Admins looking for support should first look at the application help page. They can also contact the development team at one of their emails, which they should have.
Users looking for help seek out assistance from the application help page. If this does not help them, they should seek out assistance from their officers.
