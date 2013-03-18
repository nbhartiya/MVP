# == Schema Information
#
# Table name: survey_answers
#
#  id                 :integer          not null, primary key
#  survey_question_id :integer
#  text               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class SurveyAnswer < ActiveRecord::Base
  
  belongs_to :survey_question
  
  attr_accessible :survey_question_id, :text
end
