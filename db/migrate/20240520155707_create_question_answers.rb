class CreateQuestionAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :question_answers do |t|
      t.references :coman, null: false, foreign_key: {to_table: :users}
      t.references :brand, null: true, foreign_key: {to_table: :users}
      t.references :ingredient, null: false, foreign_key: true
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
