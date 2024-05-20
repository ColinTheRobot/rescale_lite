class QuestionAnswersController < ApplicationController
  def new
    user = get_current_user

    # throw an error if user.is_brand? == true

    @question_answer = QuestionAnswer.new(
      coman_id: user.id,
      ingredient_id: question_answer_params[:ingredient_id]
    )
  end

  def create
    user = get_current_user
    question_answer_params.merge!(coman_id: user.id)

    @question_answer = QuestionAnswer.new(
      coman_id: user.id,
      ingredient_id: question_answer_params[:ingredient_id],
      question: question_answer_params[:question]
    )

    respond_to do |format|
      if @question_answer.save
        format.html { redirect_to recipe_url(@question_answer.ingredient.recipe), notice: "Interaction was successfully created." }
        format.json { render :show, status: :created, location: @question_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def question_answer_params
    params.permit(:question).merge(
      ingredient_id: params[:ingredient_id].to_i,
      question: params.dig(:question_answer, :question) # super unclear why this isn't being allowed by strong params. Ignoring for now I'm sure I just have the form implemented slightly wrong.
    )
  end
end
