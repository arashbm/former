require 'test_helper'

class Admin::FilledFormsControllerTest < ActionController::TestCase
  setup do
    @admin_filled_form = admin_filled_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_filled_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_filled_form" do
    assert_difference('Admin::FilledForm.count') do
      post :create, admin_filled_form: {  }
    end

    assert_redirected_to admin_filled_form_path(assigns(:admin_filled_form))
  end

  test "should show admin_filled_form" do
    get :show, id: @admin_filled_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_filled_form
    assert_response :success
  end

  test "should update admin_filled_form" do
    put :update, id: @admin_filled_form, admin_filled_form: {  }
    assert_redirected_to admin_filled_form_path(assigns(:admin_filled_form))
  end

  test "should destroy admin_filled_form" do
    assert_difference('Admin::FilledForm.count', -1) do
      delete :destroy, id: @admin_filled_form
    end

    assert_redirected_to admin_filled_forms_path
  end
end
