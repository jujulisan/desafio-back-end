
FactoryBot.define do
  factory :transaction do
    association :store
    association :kind_transaction
    value { 30.00 }
    cpf { '09620676017' }
    card { '4753****3153' }
    occurred_time { DateTime.now }
  end
end