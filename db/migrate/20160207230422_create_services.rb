class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      
      t.timestamps null: false
    end
  end
end
