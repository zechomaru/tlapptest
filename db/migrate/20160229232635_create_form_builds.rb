class CreateFormBuilds < ActiveRecord::Migration
  def change
    create_table :form_builds do |t|
    	t.string :name
    	t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
