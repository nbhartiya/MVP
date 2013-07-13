class RenameKindForSurveyQuestion < ActiveRecord::Migration
  def up
  	rename_column :survey_questions, :kind, :for_chef
  end

  def down
  	rename_column :survey_questions, :for_chef, :kind
  end
end
