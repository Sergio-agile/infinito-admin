# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

500.times do
  patient = Patient.create(first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name,
                    birthdate: Faker::Date.birthday(min_age: 0, max_age: 65),
                    phone: Faker::PhoneNumber.phone_number,
                    address: Faker::Address.full_address)
  3.times do
    Consultation.create(notes_before: Faker::Books::Lovecraft.paragraph,
                    notes_after: Faker::Books::Lovecraft.paragraph,
                    date: Faker::Date.between(from: '2021-01-01', to: '2022-09-01'),
                    patient: patient)
  end
end
