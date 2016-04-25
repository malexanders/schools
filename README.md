# Ruby version
ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin13]

# Rails version
Rails 4.2.5.1

# Install postgresql
If you do not already have postgresql installed and configured, follow this link:

For Mac
http://www.postgresql.org/download/macosx/

For Linux
https://wiki.postgresql.org/wiki/Detailed_installation_guides

# Install gems and set up database
## Run these commands in the terminal, inside the app directory
1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. `rake db:seed`

# Confirming the db has the schools data
Run `rails c` then `School.all`

# API

Run `rails s` in terminal to start a local rails server

To show json data for all schools, navigate to:
http://localhost:3000/schools

To show json data for a single school, navigate to:
http://localhost:3000/schools/:slug

# Running Test Suite

Run `rspec --format documentation` in terminal from inside the app directory.
