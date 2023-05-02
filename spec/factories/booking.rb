FactoryBot.define do
  factory :booking do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    animal_name { Faker::Creature::Animal.name }
    date_of_service { Date.today }

    trait :cat do
      animal_type { 'cat' }
    end

    trait :dog do
      animal_type { 'dog' }
    end
  end
end