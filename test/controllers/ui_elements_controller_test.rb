require 'test_helper'

class UiElementsControllerTest < ActionController::TestCase
  setup do
    @ui_element = ui_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ui_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ui_element" do
    assert_difference('UiElement.count') do
      post :create, ui_element: { content_id: @ui_element.content_id, meta: @ui_element.meta, presenter_id: @ui_element.presenter_id, user_id: @ui_element.user_id }
    end

    assert_redirected_to ui_element_path(assigns(:ui_element))
  end

  test "should show ui_element" do
    get :show, id: @ui_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ui_element
    assert_response :success
  end

  test "should update ui_element" do
    patch :update, id: @ui_element, ui_element: { content_id: @ui_element.content_id, meta: @ui_element.meta, presenter_id: @ui_element.presenter_id, user_id: @ui_element.user_id }
    assert_redirected_to ui_element_path(assigns(:ui_element))
  end

  test "should destroy ui_element" do
    assert_difference('UiElement.count', -1) do
      delete :destroy, id: @ui_element
    end

    assert_redirected_to ui_elements_path
  end
end
