class AddReferencesFormBuildToPages < ActiveRecord::Migration
  def self.up
    change_table :pages do |t|
    	t.references :form_build, index: true, foreign_key: true
    end
  end

  def self.down
    
  end
end
