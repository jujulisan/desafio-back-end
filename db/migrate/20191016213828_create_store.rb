class CreateStore < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.text :name
      t.text :owner_name  
    end
  end
end
