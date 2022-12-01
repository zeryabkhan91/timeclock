# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# System Dependencies

* Ruby version
  `3.1.1`

* Rails Version
  `7.0.3`

* Bundler Version
  `2.3.9`

* Databse
  `Postgres`

# Project Setup

* Install Depencies
  `bundle install`

* Database creation
  `rake db:create`

* Database initialization
  `rake db:migrate`

* Start server
  `rails server`

* How to run the test suite
  `rails test`

# Deployment
  I tried deploying it to the Heorku but as Heorku dropped hobby tier database support that's why didn't went through the plan

# How to use
  There are 2 Dashboards:

  - Worker Dashboard: `http://localhost:3000`
  - Manager Dashboard: `http://localhost:3000/manager_dashboard`

  I didn't added any authentication and authorization for now, both dashboards are open. I didn't focus much on the UI part and created just simple buttons and forms to navigate


