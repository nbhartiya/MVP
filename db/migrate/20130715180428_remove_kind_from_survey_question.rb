class RemoveKindFromSurveyQuestion < ActiveRecord::Migration
  def up
    remove_column :survey_questions, :kind
    add_column :survey_questions, :for_chef, :boolean
  end

  def down
    add_column :survey_questions, :kind, :string
    remove_column :survey_questions, :for_chef
  end
end
