FactoryBot.define do
  factory :store do
    name { Faker::Company.bs }
    owner_name { Faker::Name.name }
  end
end
