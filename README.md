# TRAILS Demo App

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Then, set up the PostgreSQL database:

```
$ rails db:setup
```

Next, migrate the database:

```
$ rails db:migrate
```

And seed some data for display:

```
$ rails db:seed
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
