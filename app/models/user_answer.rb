class UserAnswer < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :survey_question
  
  attr_accessible :survey_question_id, :text, :user_id
end
