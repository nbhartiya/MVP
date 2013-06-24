class AddFieldsToSurveyQuestions < ActiveRecord::Migration
  def change
    add_column :survey_questions, :low_extreme, :text
    add_column :survey_questions, :high_extreme, :text
    add_column :survey_questions, :format, :string
    add_column :survey_questions, :active, :boolean
  end
end
