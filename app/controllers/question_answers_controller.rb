class QuestionAnswersController < ApplicationController
  def new
    user = get_current_user

    # TODO: currently we rely on the cookie to provide the current user and
    # restrict permissions based on that. This means we don't necessarily need
    # to rely on restful routing to access the current user, this is one of those
    # choices that will have a longer term impact than shorter. Do we rely on the cookie
    # and always use that? How much do we care about restful routing as it pertains to the user
    #
    # We should add another check here to  make sure the user is actually a coman and not a brand

    @question_answer = QuestionAnswer.new(
      coman_id: user.id,
      ingredient_id: question_answer_params[:ingredient_id]
    )
  end

  def edit
    @question_answer = QuestionAnswer.find(params[:id])
  end

  def update
    @question_answer = QuestionAnswer.find(params[:id])
    user = get_current_user

    respond_to do |format|
      if @question_answer.update(
          ingredient_id: question_answer_params[:ingredient_id],
          answer: question_answer_params[:answer],
          brand_id: user.id
      )
        # Interaction is pottentially a good name as an alternative to QuestionAnswer
        # Probably not specific enough but does get us closer to what's happening
        # between the two businesses vs being very literal. 
        format.html { redirect_to recipe_url(@question_answer.ingredient.recipe), notice: 'Interaction was successfully created.' }
        format.json { render :show, status: :ok, location: @question_answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end

  end

  def create
    user = get_current_user
    # Merging the user.id as coman_id. With more time there is certainly a more railsy way to do this
    # What I like about this for now is the simplicity we aren't committing to Building out different
    # users with single table inheritance or a UserType object. There are a lot of ways to handle this. 
    #
    question_answer_params.merge!(coman_id: user.id)

    @question_answer = QuestionAnswer.new(
      coman_id: user.id,
      ingredient_id: question_answer_params[:ingredient_id],
      question: question_answer_params[:question]
    )

    respond_to do |format|
      if @question_answer.save
        format.html { redirect_to recipe_url(@question_answer.ingredient.recipe), notice: 'Interaction was successfully created.' }
        format.json { render :show, status: :created, location: @question_answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def question_answer_params
    # Haven't had to worry about strong params in a minute! 
    # Super unclear to me why question/answer aren't being allowed by strong params.
    #
    # Ignoring but I'm sure I just have the form implemented slightly wrong.
    #
    # To get around this issue I'm just merging the params I specifically want into strong params here
    params.permit(:question).merge(
      ingredient_id: params[:ingredient_id].to_i,
      question: params.dig(:question_answer, :question),
      answer: params.dig(:question_answer, :answer)
    )
  end
end
