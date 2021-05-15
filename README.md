# Book Store for RubyGarage

The idea of the project is an online book shop for customers who are interested in mobile development, photo, web design, web development, and other topics. The list of topics can change depending on data in Admin Panel.
The web application will let registered users or guests find and buy books using a mobile phone, tablet, laptop, or PC.

- [Website specification](https://drive.google.com/drive/folders/0B3jvg6jQR0D9QlV3RjducDEta3M)
- ToDo [Cards](https://github.com/TurVitAn/book-store-rg/projects/1) Book Store Rg 
- Use [Tools](https://github.com/TurVitAn/book-store-rg/projects/1#card-62554416)

## Deploy for testing on [Heroku](https://bookstore-rg-turvitan.herokuapp.com/) or [BookStore-rg](http://bookstore-rg.turvitan.km.ua/)
- Available coupons for orders:
    - coupon_10 (10%)
    - coupon_25 (25%)
    - coupon_30 (30%)
    - coupon_50 (50%)
    - or [create new](https://bookstore-rg-turvitan.herokuapp.com/admin/coupons)

    **NOTE: Coupon can be applied only for ONE order**
    
## [Admin](https://bookstore-rg-turvitan.herokuapp.com/admin/login) for testing
- **email:    admin@example.com**
- **password: password**

## How to install

- Run **'bundler install'** - installation of packages prescribed in *Gemfile*;
- Run **'yarn install'** - installation of packages prescribed in *package.json*;
- Run **'rails db:create'** - create database;
- Run **'rails db:migrate'** - run the database migrations;
- Run **'rails db:seed'** - load the seed data for database;
- Run **'rails server'** - start the Rails server;

- Go to *localhost:3000*.

## Usage

- ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
- Rails 6.1.3
- PostrgeSQL 12
- Testing: Rspec
- CI: CircleCI
