# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :poll,
    class_name: 'Poll',
    foreign_key: :poll_id

  has_many :answer_choices,
    class_name: 'AnswerChoice',
    foreign_key: :question_id
end