# README

## Introduction ##

The Eta Sigma Gamma Member Tracker is designed to store attendance and points for the users within the organization. Members are added to the application by signing in with their TAMU accounts, and events are created by an officer of the organization. Attendance is noted by the time the member signs up so that they can see that they are on time.

## Requirements ##

This code has been run and tested on:

Environment
•	Operating System Windows 10
•	Docker Engine v 20.10.17
•	Docker container v 1.6.6
•	Heroku
•	Others

Program
•	Ruby v 3.0.2
•	Rails v 6.1.4.1
•	Rspec-rails v 6.0.1
•	PostgreSQL v 13.4
•	jQuery-rails 3.3
The following gems were used:
•	Rails, pg, puma, sass-rails, webpacker, turbolinks, jbuilder, redis, bcrypt, image_processing, bootsnap, byebug, web-console, rack-mini-profiler, listen, sring, capybara, selenium-websriver, webdrivers, tzinfo-data, rexml, brakeman, simplecov, rspec-rails, devise, omniauth, omniauth-google-oauth2, omniauth-rails_csrf_protection v1.0, phonelib, twilio-ruby, rubocop

Tools
•	Git Hub
•	RuboCop v 1.38.0
•	Simplecov v 0.21.2
•	Brakeman v 5.4.0
•	Jira
•	Visual Studio Code v 1.73
•	Others
•	HTML
•	CSS
•	Bootstrap 4



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

CI/CD is done through Heroku, which is continuously updating the servers based on what has been pushed. Rubocop and Brakeman are also being used to help with this. GitHub actions also it used to help automate the testing process. A code coverage of above 90% is acceptable for the application. Finally, there is a testing server used for continuous delivery to make sure the app works properly when deployed.

## Support ##

Admins looking for support should first look at the application help page. They can also contact the development team at one of their emails, which they should have.
Users looking for help seek out assistance from the application help page. If this does not help them, they should seek out assistance from their officers.
