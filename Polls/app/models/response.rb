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

  belongs_to :user,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id,
  

  belongs_to :choice,
    class_name: 'AnswerChoice',
    primary_key: :id,
    foreign_key: :answer_choice
end
