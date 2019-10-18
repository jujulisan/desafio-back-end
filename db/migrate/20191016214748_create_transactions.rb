class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :store, foreign_key: true
      t.references :kind_transaction, foreign_key: true
      t.float :value
      t.string :cpf
      t.string :card
      t.datetime :occurred_time
    end
  end
end
