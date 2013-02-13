class SurveyQuestion < ActiveRecord::Base
  
  has_many :survey_answers
  
  attr_accessible :question, :kind
end
