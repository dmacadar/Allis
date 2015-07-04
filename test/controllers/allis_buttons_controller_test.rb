require 'test_helper'

class AllisButtonsControllerTest < ActionController::TestCase
  setup do
    @allis_button = allis_buttons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allis_buttons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allis_button" do
    assert_difference('AllisButton.count') do
      post :create, allis_button: { eml_warning: @allis_button.eml_warning, interval: @allis_button.interval, message_warning: @allis_button.message_warning, start_date: @allis_button.start_date, subject_warning: @allis_button.subject_warning, udate_date: @allis_button.udate_date, user_id: @allis_button.user_id, warns: @allis_button.warns, word: @allis_button.word }
    end

    assert_redirected_to allis_button_path(assigns(:allis_button))
  end

  test "should show allis_button" do
    get :show, id: @allis_button
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allis_button
    assert_response :success
  end

  test "should update allis_button" do
    patch :update, id: @allis_button, allis_button: { eml_warning: @allis_button.eml_warning, interval: @allis_button.interval, message_warning: @allis_button.message_warning, start_date: @allis_button.start_date, subject_warning: @allis_button.subject_warning, udate_date: @allis_button.udate_date, user_id: @allis_button.user_id, warns: @allis_button.warns, word: @allis_button.word }
    assert_redirected_to allis_button_path(assigns(:allis_button))
  end

  test "should destroy allis_button" do
    assert_difference('AllisButton.count', -1) do
      delete :destroy, id: @allis_button
    end

    assert_redirected_to allis_buttons_path
  end
end
