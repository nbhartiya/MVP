class AddTopicToSurveyQuestions < ActiveRecord::Migration
  def change
    add_column :survey_questions, :topic, :string
  end
end
