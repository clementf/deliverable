# Deliverable
Deliverable keeps track of email opens, clicks and related events, directly in your Ruby on Rails app.

It uses webhooks from email relays to keep track of what happened to an email sent from your app.

It currently supports Sendgrid (only).

## Usage
In your mailers, you need to create a `Deliverable::Email`, and pass a deliverable_id param to the mailer.

```
deliverable_email = Deliverable::Email.create!(
  email_name: "order_confirmation",
  entity: @order
)

mail(to: @order.customer.email, subject: "Your order has been confirmed", deliverable_id: deliverable_email.id)
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "deliverable"
```

And then execute:
```bash
$ rails g deliverable:install
```
 to create the migraiton file in your app.

Then run the migration
```bash
$ rails db:migrate
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
