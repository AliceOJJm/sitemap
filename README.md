# Sitemap App

## Requirements

* Ruby version 2.6.1

* Rails version 6.0.0.rc2

* Npm, Yarn (Assets are powered by rails assets along with webpack)

* PostgreSQL 11.3

## To run the project in development environment:

- Run `cp config/database.example.yml config/database.yml` and edit database access config
- Run `bundle install`
- Run `yarn install`
- Run `rails db:setup`
- Use overmind/foreman to start an application

## Tests

Models and controllers are covered with unit tests using RSpec
Integrational tests with Capybara

- Run rspec spec
