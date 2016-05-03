class CreateFormAnswers < ActiveRecord::Migration
  def change
    create_table :form_answers do |t|
      t.string :content
      t.belongs_to :form, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
