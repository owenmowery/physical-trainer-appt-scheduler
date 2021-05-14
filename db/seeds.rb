# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trainer.destroy_all
Client.destroy_all
Appointment.destroy_all

10.times do 
    Client.create(
        name: Faker::Name.name,
        client_email: Faker::Internet.email,
        age: Faker::Number.number(digits: 2),
        height: Faker::Number.number(digits: 1),
        weight: Faker::Number.number(digits: 3),
        goal: Faker::Quote.famous_last_words
        password: "password"
    )

    Appointment.create(
        appt_datetime: Faker::Date.between(from: '2014-09-23', to: '2014-09-25')
    )

end

5.times do
    Trainer.create(
        name: Faker::Name.name,
        trainer_email: Faker::Internet.email,
        gym_name: Faker::Company.name,
        password: "password"
    )
end