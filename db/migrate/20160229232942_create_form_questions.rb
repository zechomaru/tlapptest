class CreateFormQuestions < ActiveRecord::Migration
  def change
    create_table :form_questions do |t|
      t.string :content
      t.belongs_to :form_build, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
