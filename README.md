# Grocery List API Service

## Prerequisites
* Ruby 2.3.6+
* Bundler

## Initial Setup
Install gem dependencies with `bundle install`, create, migrate, and seed the
database with `rake db:setup`, then finally run the RSpec tests to ensure
everything is working.

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

## Authentication
Clients can login with the route `/login` with `email` and `password`, which
then returns a JWT to authenticate further calls. A default user with the email
`user@example.com` and password `admin` is created with `db/seeds.rb` during
`rake db:setup`. Feel free to edit that file before running setup/seeds to make
a different custom user.

```
POST /login
{"auth": {"email": "user@example.com", "password": "admin"}}
```

Example response:
```
HTTP/1.1 201 Created
{"jwt":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTkxMjc4NjYsInN1YiI6MX0.1nGQApW4tKGSsQ9OGEoMz5f21W20aDI-d2JRRr5Z_sI"}⏎ 
```

To make calls to authenticated routes, simply include the JWT in the HTTP
Authorization header for those calls:
```
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1MTkxMjc4NjYsInN1YiI6MX0.1nGQApW4tKGSsQ9OGEoMz5f21W20aDI-d2JRRr5Z_sI
GET /grocery_items
```
