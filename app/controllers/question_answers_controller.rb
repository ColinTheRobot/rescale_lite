class QuestionAnswersController < ApplicationController
  # before_action :set_question_answer, only: [:new]

  def show
  end

  def new
    user = get_current_user

    # throw an error if user.is_brand? == true

    @question_answer = QuestionAnswer.new(coman_id: user.id)
  end

  # GET /recipes/1/edit
  def edit
  end

  def create
    user = get_current_user
    question_answer_params.merge!(coman_id: user.id)

    @question_answer = QuestionAnswer.new(coman_id: user.id, question: question_answer_params[:question])

    respond_to do |format|
      if @question_answer.save
        format.json { render :show, status: :created, location: @question_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def question_answer_params
    params.require(:question_answer).permit(:question)
  end
end
