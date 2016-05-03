class FormAddToReferencesStatusOrder < ActiveRecord::Migration
  def self.up
    change_table :forms do |t|
    	t.references :status_order, index: true, foreign_key: true
    end
  end

  def self.down
    
  end
end
