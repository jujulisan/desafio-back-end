require 'rails_helper'

RSpec.describe CalculateTotal, type: :business do
  describe '.result' do 
    let!(:kind) { create(:kind_transaction, signal: :plus) }
    let!(:transaction) { create(:transaction, value: 45.00) }
    let!(:transaction_two) { create(:transaction, kind_transaction: kind, value: 15.00) }
    subject do 
      described_class.new(Transaction.all).result
    end

    it 'returns correct total' do
      expect(subject).to eq(-30.00)
    end
  end
end