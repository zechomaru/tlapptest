class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2

      t.references :freelance, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
