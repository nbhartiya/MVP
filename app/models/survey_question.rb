# == Schema Information
#
# Table name: survey_questions
#
#  id           :integer          not null, primary key
#  kind         :string(255)
#  question     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  topic        :string(255)
#  low_extreme  :text
#  high_extreme :text
#  format       :string(255)
#  active       :boolean
#

class SurveyQuestion < ActiveRecord::Base 
  has_many :survey_answers
  has_many :user_answers
  attr_accessible :question, :kind, :topic
end
