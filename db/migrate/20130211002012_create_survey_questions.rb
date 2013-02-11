class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.string :type
      t.text :question

      t.timestamps
    end
  end
end
