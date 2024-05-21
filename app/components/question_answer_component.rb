# frozen_string_literal: true

class QuestionAnswerComponent < ViewComponent::Base
  def initialize(question_answer:, current_user:, url:)
    @question_answer = question_answer
    @current_user = current_user
    @url = url
  end
end
