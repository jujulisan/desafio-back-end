class StoresController < ApplicationController
  before_action :find_store, only: :show
  def index
    @stores = Store.all

    render :index
  end

  def show
    @transactions = @store.transactions
    @result = CalculateTotal.new(@transactions).result
    render :show
  end

  private
    def find_store
      @store = Store.find_by(id: params[:id])
    end
end