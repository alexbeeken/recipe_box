## Recipe Box

This is an app that helps you store and retrieve recipes for your dog.


Installation
------------

To run the primary application and/or any of the included RSpec files for
testing, run either the included Gemfile or manually
install the following gems:

```ruby
rspec
rake
sinatra
sinatra-contrib
sinatra-activerecord
pg
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active session. At the time of
creation of this application, Postgres 9.4 was used. To create the necessary database schema, enter the following Rake statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.2.0 was used.


## Tests

Simply run `rspec` inside of the project directory.


## Contributing

Fork the project and then replace the url in Installation instructions with that of your own copy.

If you are confused don't hesitate to email me at aeb242@gmail.com.

Known Bugs
----------

None as of 2015-01-29.

Author
------

Alex Beeken & Kathryn Carr

## License

MIT
