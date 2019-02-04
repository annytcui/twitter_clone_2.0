# TRAILS Demo App

This is a demo app built with Ruby on Rails.

## Getting started

To get started with the app, make sure you have postgreSQL installed.

First, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Then, log in PostgreSQL interactive terminal, create user "trails", and grant user "trails" with superuser privileges:

```
$ psql
# CREATE USER trails WITH PASSWORD 'umich-trails';
# ALTER ROLE trails SUPERUSER;
# \q
```

> Note: to run the above commands correctly in PostgreSQL interactive terminal, semicolons are very important.

Next, set up the database:

```
$ rails db:setup
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

If you have any questions or suggestions for improvement, please feel free to email me at <tianyuancuipan@gmail.com>.
