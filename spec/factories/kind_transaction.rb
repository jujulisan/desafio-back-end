FactoryBot.define do
  factory :kind_transaction do
    kind { 3 }
    description { 'Transferência' }
    nature { 'output' }
    signal { 'minus' }
  end
end