class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :kind
      t.text :question

      t.timestamps
    end
  end
end
