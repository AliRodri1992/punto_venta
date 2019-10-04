FactoryBot.define do
  factory :company do
    name { FFaker::Company::name }
    website { FFaker::Company::name }
  end
end
