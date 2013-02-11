require 'test_helper'

class SurveyQuestionsControllerTest < ActionController::TestCase
  setup do
    @survey_question = survey_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_question" do
    assert_difference('SurveyQuestion.count') do
      post :create, survey_question: { question: @survey_question.question, type: @survey_question.type }
    end

    assert_redirected_to survey_question_path(assigns(:survey_question))
  end

  test "should show survey_question" do
    get :show, id: @survey_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_question
    assert_response :success
  end

  test "should update survey_question" do
    put :update, id: @survey_question, survey_question: { question: @survey_question.question, type: @survey_question.type }
    assert_redirected_to survey_question_path(assigns(:survey_question))
  end

  test "should destroy survey_question" do
    assert_difference('SurveyQuestion.count', -1) do
      delete :destroy, id: @survey_question
    end

    assert_redirected_to survey_questions_path
  end
end
