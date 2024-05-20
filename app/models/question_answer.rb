# Don't like this name and would love to speak with the stakeholder about what
# we call this interaction that happens between coman and brand

class QuestionAnswer < ApplicationRecord
  belongs_to :coman, class_name: 'User'
  belongs_to :brand, class_name: 'User', optional: true
  belongs_to :ingredient
end
