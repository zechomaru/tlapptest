class CreateFRoles < ActiveRecord::Migration
  def change
    create_table :f_roles do |t|
    	t.string :name

      t.timestamps null: false
    end
  end
end
