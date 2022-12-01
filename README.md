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

# Worker Portal

`http://localhost:3000`

There are 2 links visible in the Worker portal one is `Register` and other one is `TimeClock`, User will click on Register link and and got redirected to a page where user will enter `name` and `Date of Birth` 

System will generate a unique identififer the the worker and return it in a flash message, user needs to save that ID and use it to track time on the timeClock page.

# Manager Portal

`http://localhost:3000/manager_dashboard`

When user navigates to manager dashboard user will see list of all the workers and total time logged by the user.

# Tech Stack

- Ruby on Rails

- HTMl / Haml
- Bootstrap
- JQuery
- minitest

# Future Enhancements

- Instead of showing total time logged by the worker in the whole lifespan we should show time logged during a particular day
- We can add filters inside manager dashboard so that user can select a date range and then system fetch time between that date range for all the workers
- We can integrate devise so that we can create profile and then user should login and see the history of time log by himself / herself
- Manager portal should be accessible based on the role
- Frontend (UX) can be improved



