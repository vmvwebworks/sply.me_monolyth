# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Payment.destroy_all

Payment.create!([
  {
    payer_id: 4,
    provider_id: 7,
    ammount: 8,
    currency: "EUR",
    minutes: 40,
    state: "paid"
  },
  {
    payer_id: 7,
    provider_id: 2,
    ammount: 20,
    currency: "USD",
    minutes: 24,
    state: "paid"
  },
  {
    payer_id: 6,
    provider_id: 7,
    ammount: 40,
    currency: "EUR",
    minutes: 25,
    state: "paid"
  },
  {
    payer_id: 7,
    provider_id: 2,
    ammount: 50,
    currency: "USD",
    minutes: 10,
    state: "paid"
  },
  {
    payer_id: 8,
    provider_id: 7,
    ammount: 30,
    currency: "EUR",
    minutes: 60,
    state: "paid"
  },
  {
    payer_id: 7,
    provider_id: 5,
    ammount: 20,
    currency: "USD",
    minutes: 40,
    state: "paid"
  },
  {
    payer_id: 6,
    provider_id: 7,
    ammount: 15,
    currency: "EUR",
    minutes: 5,
    state: "paid"
  },
  {
    payer_id: 7,
    provider_id: 2,
    ammount: 20,
    currency: "USD",
    minutes: 90,
    state: "paid"
  },
  {
    payer_id: 3,
    provider_id: 7,
    ammount: 30,
    currency: "EUR",
    minutes: 40,
    state: "pending"
  },
  {
    payer_id: 7,
    provider_id: 5,
    ammount: 38,
    currency: "USD",
    minutes: 50,
    state: "pending"
  },
  {
    payer_id: 1,
    provider_id: 7,
    ammount: 18,
    currency: "EUR",
    minutes: 5,
    state: "pending"
  },
  {
    payer_id: 7,
    provider_id: 5,
    ammount: 26,
    currency: "USD",
    minutes: 80,
    state: "pending"
  }
])
