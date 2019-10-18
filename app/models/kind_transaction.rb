class KindTransaction < ActiveRecord::Base
  has_many :transactions
  
  enum signal: [:minus, :plus]
  enum nature: [:input, :output]
end