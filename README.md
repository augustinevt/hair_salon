# Hair Salon Manager

#### Keep track of your stylists and clients!

#### By August von Trapp

## Description

this application allows a salon manager to create, edit and delete stylists in real time!

## Setup/Installation Requirements

* Go to [github](https://github.com/augustinevt/hair_salon) and clone the repository
* Make sure you have all the gem dependencies bundled before running the app locally!

## database Setup
Please set up your database like this:
* CREATE DATABASE hair_salon;
* CREATE DATABASE hair_salon_test;
* CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, rate varchar);
* CREATE TABLE clients (id serial PRIMARY KEY, name varchar, phone varchar, stylist_id int);

## Known Bugs

There are no known bugs.

## Support and contact details

Contact me at augustvontrapp@gmail.com

## Technologies Used

* ruby
* rspec/capybara
* postgres
* SQL
* Sinatra
* CSS
* HTML
* JavaScript
* jQuery

### License

Copyright (c) 2016 August von Trapp
