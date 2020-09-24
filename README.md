# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Visitors can create an account, login, and logout. When giving admin access, users can add categories and products to the site. Shoppers can add items to their cart, pay using a credit card, and then recieve an order confirmation via the site. When an item has no more inventory, a sold out bander will appear. 

## Screenshots

### Home Page
!["Screenshot of Home Page"](https://github.com/MonicaLuca/jungle-rails/blob/master/docs/home_page.png?raw=true)

### My Cart
!["Screenshot of My Cart"](https://github.com/MonicaLuca/jungle-rails/blob/master/docs/my_cart.png?raw=true)

### Tweeter Payment
!["Screenshot of Payment"](https://github.com/MonicaLuca/jungle-rails/blob/master/docs/payment.png?raw=true)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
