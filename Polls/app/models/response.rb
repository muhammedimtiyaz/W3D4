# == Schema Information
#
# Table name: responses
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  answer_choice :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Response < ApplicationRecord
  validate :no_duplicates_from_user

  belongs_to :respondent,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id
  

  belongs_to :choice,
    class_name: 'AnswerChoice',
    primary_key: :id,
    foreign_key: :answer_choice

  has_one :question,
    through: :choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  
  def respondent_already_answered?
    self.sibling_responses.exists?(user_id: self.user_id)
  end
  
  private

  def no_duplicates_from_user
    if self.respondent_already_answered?
      errors[:user_id] << 'user already responded to the question.'
    end
  end


end
