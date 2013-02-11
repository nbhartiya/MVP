class UserAnswer < ActiveRecord::Base
  attr_accessible :survey_question_id, :text, :user_id
end
