class SurveyQuestion < ActiveRecord::Base 
  has_many :survey_answers
  has_many :user_answers
  attr_accessible :question, :kind, :topic
end
