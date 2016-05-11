# Medication Tracker

Medication Tracker is an app built as a final project at Launch Academy. It allows the user to record their prescription and physician
information and view medication side effects through the openFDA API.

[Visit the live site here!](http://medication-tracker.herokuapp.com)

## How to Use the Site

To test out the web application before creating an account, use the following information to log in using a test account:

1. Username: `test@email.com`
2. Password: `password`

## ER Diagram

![ER-Diagram](http://i.imgur.com/oqPpggM.png?1)

## How to Clone and Set Up Locally

1. Clone Respository: `git clone https://github.com/rowlandjl/Medication-Tracker`
2. Create database: `rake db:create`
3. Migrate database: `rake db:migrate`
4. Run local server: `rails s` to view on localhost:3000
5. Run test suite: `rake`
