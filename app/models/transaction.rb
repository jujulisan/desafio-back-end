class Transaction < ActiveRecord::Base
  belongs_to :store
  belongs_to :kind_transaction
end