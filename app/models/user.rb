class User < ApplicationRecord
  # We probably need to consider breaking up the User into User types 
  has_many :question_answers, class_name: 'QuestionAnswer', foreign_key: 'coman_id', dependent: :destroy
  has_many :question_answers, class_name: 'QuestionAnswer', foreign_key: 'brand_id', dependent: :destroy
end
