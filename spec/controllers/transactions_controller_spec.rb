require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  render_views

  describe 'GET #new' do 
    before do
      get :new
    end
    subject do
      response
    end

    it 'returns status ok' do
      is_expected.to have_http_status(:ok)
    end
  end

  describe 'POST #upload_file' do 
    context 'when are txt' do 
      let(:normalize_transaction) { double }
      let(:file_path) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/cnab_test.txt')) }
      before do
        allow(NormalizeTransaction).to receive(:new).and_return(normalize_transaction)
        allow(normalize_transaction).to receive(:run)

        post :upload_file, params: { file: file_path }
      end
      subject do
        response
      end

      it 'returns status ok' do
        is_expected.to redirect_to(stores_index_url)
      end

      it 'returns status ok' do
        expect(normalize_transaction).to have_received(:run)
      end
    end

    context "when don't are txt" do 
      let(:file_path) { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/cnab_test.yml')) }

      before do
        post :upload_file, params: { file: file_path }
      end
      subject do
        response
      end

      it 'returns status ok' do
        is_expected.to have_http_status(:forbidden)
      end

      it 'returns status ok' do
        is_expected.to render_template('transactions/new')
      end
    end 
  end

  describe 'GET #kind' do 
    let!(:kinds) { create_list(:kind_transaction, 5) }
    before do 
      get :kind
    end
    subject do
      response
    end

    it 'returns status ok' do
      is_expected.to render_template('transactions/kind')
    end

    it 'has some kind' do 
      expect(response.body).to include(kinds.first.description)
    end
  end
end