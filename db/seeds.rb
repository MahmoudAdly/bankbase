# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

default_bank_user = User.create!(
  :name => 'Basebank',
  :email => 'basebank@example.com',
  :password => 'password',
  :password_confirmation => 'password'
)

mahmoud = User.create!(
  :name => 'Mahmoud',
  :email => 'mahmoud@example.com',
  :password => 'password',
  :password_confirmation => 'password'
)

mathias = User.create!(
  :name => 'Mathias',
  :email => 'mathias@example.com',
  :password => 'password',
  :password_confirmation => 'password'
)

Transaction.create!(
  sender: default_bank_user,
  receiver: mahmoud,
  source_currency: :eur,
  target_currency: :usd,
  amount: 1000,
  exchange_rate: 1,
  status: :finished
)

Transaction.create!(
  sender: default_bank_user,
  receiver: mathias,
  source_currency: :eur,
  target_currency: :usd,
  amount: 1000,
  exchange_rate: 1,
  status: :finished
)
