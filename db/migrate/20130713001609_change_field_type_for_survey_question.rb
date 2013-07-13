class ChangeFieldTypeForSurveyQuestion < ActiveRecord::Migration
  def up
  	change_column :survey_questions, :for_chef, :boolean
  end

  def down
  	change_column :survey_questions, :for_chef, :string
  end
end
