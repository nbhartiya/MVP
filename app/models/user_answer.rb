# == Schema Information
#
# Table name: user_answers
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  survey_question_id :integer
#  text               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class UserAnswer < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :survey_question
  
  attr_accessible :survey_question_id, :text, :user_id
end
