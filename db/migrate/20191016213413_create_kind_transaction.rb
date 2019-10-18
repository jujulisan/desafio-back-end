class CreateKindTransaction < ActiveRecord::Migration[5.2]
  def change
    create_table :kind_transactions do |t|
      t.integer :kind
      t.text :description
      t.integer :nature
      t.integer :signal
    end
  end
end
