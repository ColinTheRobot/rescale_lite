class Ingredient < ApplicationRecord
  belongs_to :recipe
  has_many :question_answers
  enum units:  { g: 0, kg: 1, oz: 2, lbs: 3, ml: 4, l: 5, fl_oz: 6, c: 7, pt: 8, qt: 9, gal: 10 }, _prefix: true
end
