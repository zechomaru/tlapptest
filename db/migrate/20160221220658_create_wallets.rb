class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
    	t.decimal :money, precision: 10, scale: 2
      t.timestamps null: false
      t.references :freelance, index: true, foreign_key: true
    end
  end
end
