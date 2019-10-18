require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  render_views

  describe '#index' do

    context "when don't has Stores" do
      before do
        get :index
      end

      it 'response body responds nil resource' do
        expect(response.body).to_not include('td')
      end
    end

    context 'when has Stores' do
      let!(:stores) { create_list(:store, 5) }
      before do
        get :index
      end

      it 'response body responds has store name' do
        expect(response.body).to include(stores.first.name)
      end

      it 'response body responds has store owner_name' do
        expect(response.body).to include(stores.second.owner_name)
      end
    end
  end

  describe '#show' do
    let!(:store) { create(:store) } 
    let!(:transactions) { create_list(:transaction, 5, store: store) }

    before do
      get :show, params: { id: store.id }
    end

    it 'has store name' do 
      expect(response.body).to include(store.name)
    end

    it 'has transactions card' do 
      expect(response.body).to include(transactions.first.card)
    end

    it 'has transactions cpf' do 
      expect(response.body).to include(transactions.last.cpf)
    end
  end
end