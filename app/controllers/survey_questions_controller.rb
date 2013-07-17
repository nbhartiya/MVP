class SurveyQuestionsController < ApplicationController
  
  #before_filter :completed_user?
  
  def survey
    @questions = SurveyQuestion.where(:for_chef => current_user.chef, :active => true)     
  end

  def index
    @survey_questions = SurveyQuestion.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @survey_questions }
    end
  end


  def show
    @survey_question = SurveyQuestion.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey_question }
    end
  end

  def new
    @survey_question = SurveyQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey_question }
    end
  end

  def edit
    @survey_question = SurveyQuestion.find(params[:id])
  end

  def create
    @survey_question = SurveyQuestion.new(params[:survey_question])
    
    respond_to do |format|
      if @survey_question.save        
        format.html { redirect_to @survey_question, notice: 'Survey question was successfully created.' }
        format.json { render json: @survey_question, status: :created, location: @survey_question }
      else
        format.html { render action: "new" }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @survey_question = SurveyQuestion.find(params[:id])

    respond_to do |format|
      if @survey_question.update_attributes(params[:survey_question])
        format.html { redirect_to @survey_question, notice: 'Survey question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey_question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @survey_question = SurveyQuestion.find(params[:id])
    @survey_question.destroy

    respond_to do |format|
      format.html { redirect_to survey_questions_url }
      format.json { head :no_content }
    end
  end
end
