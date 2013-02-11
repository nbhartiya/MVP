class SurveyAnswersController < ApplicationController
  # GET /survey_answers
  # GET /survey_answers.json
  def index
    @survey_answers = SurveyAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @survey_answers }
    end
  end

  # GET /survey_answers/1
  # GET /survey_answers/1.json
  def show
    @survey_answer = SurveyAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey_answer }
    end
  end

  # GET /survey_answers/new
  # GET /survey_answers/new.json
  def new
    @survey_answer = SurveyAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey_answer }
    end
  end

  # GET /survey_answers/1/edit
  def edit
    @survey_answer = SurveyAnswer.find(params[:id])
  end

  # POST /survey_answers
  # POST /survey_answers.json
  def create
    @survey_answer = SurveyAnswer.new(params[:survey_answer])

    respond_to do |format|
      if @survey_answer.save
        format.html { redirect_to @survey_answer, notice: 'Survey answer was successfully created.' }
        format.json { render json: @survey_answer, status: :created, location: @survey_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @survey_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /survey_answers/1
  # PUT /survey_answers/1.json
  def update
    @survey_answer = SurveyAnswer.find(params[:id])

    respond_to do |format|
      if @survey_answer.update_attributes(params[:survey_answer])
        format.html { redirect_to @survey_answer, notice: 'Survey answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_answers/1
  # DELETE /survey_answers/1.json
  def destroy
    @survey_answer = SurveyAnswer.find(params[:id])
    @survey_answer.destroy

    respond_to do |format|
      format.html { redirect_to survey_answers_url }
      format.json { head :no_content }
    end
  end
end
