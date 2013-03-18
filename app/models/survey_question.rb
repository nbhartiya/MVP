# == Schema Information
#
# Table name: survey_questions
#
#  id         :integer          not null, primary key
#  kind       :string(255)
#  question   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic      :string(255)
#

class SurveyQuestion < ActiveRecord::Base 
  has_many :survey_answers
  has_many :user_answers
  attr_accessible :question, :kind, :topic
end
