require 'test_helper'

class AllisButtonStylesControllerTest < ActionController::TestCase
  setup do
    @allis_button_style = allis_button_styles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allis_button_styles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allis_button_style" do
    assert_difference('AllisButtonStyle.count') do
      post :create, allis_button_style: { color: @allis_button_style.color, name: @allis_button_style.name }
    end

    assert_redirected_to allis_button_style_path(assigns(:allis_button_style))
  end

  test "should show allis_button_style" do
    get :show, id: @allis_button_style
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allis_button_style
    assert_response :success
  end

  test "should update allis_button_style" do
    patch :update, id: @allis_button_style, allis_button_style: { color: @allis_button_style.color, name: @allis_button_style.name }
    assert_redirected_to allis_button_style_path(assigns(:allis_button_style))
  end

  test "should destroy allis_button_style" do
    assert_difference('AllisButtonStyle.count', -1) do
      delete :destroy, id: @allis_button_style
    end

    assert_redirected_to allis_button_styles_path
  end
end
