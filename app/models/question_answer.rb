# Don't like this name and would love to speak with the stakeholder about what
# we call this interaction that happens between coman and brand

class QuestionAnswer < ApplicationRecord
  # A question requires a coman_id to be present but a brand, which provides 
  # the answer is optional. 
  #
  # There's a lot of different ways we could build this out. This could be 
  # a lot more complex acting as a longer thread. With multipe responses/back and forth
  #
  # Or we could model questions and answers seperately. 
  #
  # We might consider adding a resolved: boolean value or something that gets set
  # when a brand answers a question so we could more easily filter questions waiting 
  # for answers etc. THis could also be done through sql via scope etc.
  #
  belongs_to :coman, class_name: 'User'
  belongs_to :brand, class_name: 'User', optional: true
  belongs_to :ingredient
end
