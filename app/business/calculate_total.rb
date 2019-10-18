class CalculateTotal
  def initialize(transactions)
    @transactions = transactions
  end

  def result
    total = 0
    
    @transactions.each do |transaction|
      return total = total + transaction.value if transaction.kind_transaction.plus?
      total = total - transaction.value 
    end

    total
  end
end