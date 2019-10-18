require 'rails_helper'

RSpec.describe NormalizeTransaction, type: :business do
  describe '.run' do 
    let!(:kind) { create(:kind_transaction) }
    let(:file_path) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/cnab_test.txt')) }

    before do 
      described_class.new(file_path).run
    end

    it 'create store' do 
      expect(Store.count).to eq(1)
    end

    it 'create transaction' do 
      expect(Transaction.count).to eq(1)
    end

    it 'Transaction user correct kind' do 
      expect(Transaction.last.kind_transaction).to eq(kind)
    end

    it 'Transaction user correct store' do 
      expect(Transaction.last.store).to eq(Store.last)
    end
  end
end