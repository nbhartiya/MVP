class SurveyAnswer < ActiveRecord::Base
  attr_accessible :survey_question_id, :text
end
