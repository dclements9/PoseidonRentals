# Poseidon Rentals

Poseidon Rentals is a rental reservation system. A user can Sign up with an email or OAuth with Github. 

A user is then able to reserve equipment for a date & time. A user can also edit or delete a reservation as needed.

Admins are able to add, edit, and delete equipment.

## Installation
**Ruby 2.7.1 is required.**

To get started, run the following commands:
```ruby
bundle install
```
```ruby
rails db:create && rails db:migrate
```
_Optional:_ 
    If you would like to seed sample data run:
```ruby
rails db:seed
```
Sample data includes:

    1. 5 Equipment objects
    2. 1 User Object (email: testing@testing.com password: testing)
    3. 1 User Admin Object (email: admin@admin.com password: admin)
    4. 1 Reservation object for Admin & Boat
<!-- ```ruby
thin start --ssl
``` -->

```ruby
rails s
```

Navigate to https://localhost:3000 in a web browser.

## Notes on Admin Users

During testing, to change a user to an admin, run:

```ruby
current_user.update_attribute :admin, true
```
**current_user** can be replaced with any user.

## Development

To release a new version, update the version number in `version.rb`. Push git commits and tags.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dclements9/PoseidonRentals. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Poseidon Rentals project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dclements9/PoseidonRentals/blob/master/CODE_OF_CONDUCT.md).

