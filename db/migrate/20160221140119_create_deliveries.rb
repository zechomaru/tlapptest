class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
    	t.string :name
    	t.decimal :price, precision: 10, scale: 2
    	t.text :description
    	t.belongs_to :service, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
