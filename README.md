# README

Hello traveler, this is the blog API for the LIM Test, you need to know how it works.

* Ruby version

 - 5.0.0.1

* System dependencies
 
 - Gem pg and postgres connector

* Configuration 

 - Copy the .env.example to .env
 - Change the file variables with the database username, password, port and host. Also, there's a secret key base option for production.
 - Copy the config/database.yml.example to config/database.yml too!

* Database creation

 - rails db:create

* Database initialization

 - rails db:migrate

* How to run the test suite

 - rails test test/{section}/{test_file.rb}

* Services (job queues, cache servers, search engines, etc.)

 - No services for now

* Deployment instructions

 - You can deploy with passenger, the documentation is great to make it. https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/

* API
 The API is really simple, they have just 3 methods (Watch the Rdoc document too :D)
 - /api/v1/content/create
 - /api/v1/content/{url}
 - /api/v1/url/list_all
