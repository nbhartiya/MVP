# == Schema Information
#
# Table name: survey_questions
#
#  id           :integer          not null, primary key
#  for_chef     :boolean
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
  has_many :images, :as => :imageable, :class_name =>"Image"
  attr_accessible :question, :for_chef, :topic, :low_extreme, :high_extreme, :format, :active
end
