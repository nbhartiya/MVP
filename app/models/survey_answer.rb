class SurveyAnswer < ActiveRecord::Base
  
  belongs_to :survey_question
  
  attr_accessible :survey_question_id, :text
end
