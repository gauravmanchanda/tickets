# Tickets
## Customer Support Ticketing solution

##Setup

The app uses MySQL & the mysql2 gem, so in order to install mysql2 gem, you will need to install libmysqlclient-dev package on your system.

On Ubuntu you can do it via:

  `sudo apt-get install libmysqlclient-dev`

On CentOS:

  `sudo yum install mysql-devel`

On Mac:

  `brew install mysql`

Clone the repo and go to the project folder.

You might need to update the `DYLD_LIBRARY_PATH` envronment variable.

Once in the Code folder, carry out the following steps:

* Do a `bundle install`. This will install all the Gems needed by the app.

* Run `bundle exec rake db:create db:migrate db:seed`. This would create the development and the test databases, run migrations, and add seed data.

* Run `bundle exec rails server`. This will fire up the app server at port `3000`. You can visit `http://localhost:3000` on you browser and you should see the app homepage.

These are all the accounts available you can log in using. Displayed as username/password:


###Admin Credentials

```
nickfury@shield.com/nickfury
```


###Agent Credentials

```
tony@starkindustries.com/theironman
thor@asgard.com/thortheking
blackwidow@shield.com/blackwidow
bbanner@culver.edu/biggreenguy
```

###Customer Credentials

```
pepper@starkindustries.com/pepper123
jfoster@gmail.com/thorlove
pcoulson@shield.com/avengers143
wanko@evil.ru/killtony
```

There is no provision to add an Agent/Admin via the app frontend. You will have to create new Admins/Agents via the console.

You can run the Rspec tests using:

  `bundle exec rspec spec`

You can run Cucumber features using:

  `bundle exec rake cucumber`


The code is a Ruby on Rails Frontend and Backend app.