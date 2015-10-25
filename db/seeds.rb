# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Address.create(first_name: 'Alex',
                      last_name: 'Shipping',
                      street_line_1: '123 Main Street',
                      street_line_2: 'Apt 1000',
                      city: 'New York',
                      postal_code: '10013',
                      region: 'New York',
                      country: 'USA',
                      type: 'ShippingAddress'
                      )

Address.create(first_name: 'Alex',
                      last_name: 'Billing',
                      street_line_1: '123 Main Street',
                      street_line_2: 'Apt 1000',
                      city: 'New York',
                      postal_code: '10013',
                      region: 'New York',
                      country: 'USA',
                      type: 'BillingAddress'
                      )
