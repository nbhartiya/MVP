class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.integer :user_id
      t.integer :survey_question_id
      t.text :text

      t.timestamps
    end
  end
end
