# Grocery List API Service

## Prerequisites
* Ruby 2.3.6+
* Bundler

## Initial Setup
Install gem dependencies with `bundle install`, setup the database with `rake`,
then finally run the RSpec tests to ensure everything is working.

```sh
bundle install
bundle exec rake db:setup
bundle exec rspec
```

## Running
Run the rails server on the default HTTP port, if possible:
```sh
sudo bundle exec rails server -p 80
```

Or an alternative port if you don't have access to port 80:
```sh
bundle exec rails server -p 3000
```
