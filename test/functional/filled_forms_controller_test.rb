require 'test_helper'

class FilledFormsControllerTest < ActionController::TestCase
  setup do
    @filled_form = filled_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filled_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filled_form" do
    assert_difference('FilledForm.count') do
      post :create, filled_form: { data: @filled_form.data, form_id: @filled_form.form_id, student_id: @filled_form.student_id }
    end

    assert_redirected_to filled_form_path(assigns(:filled_form))
  end

  test "should show filled_form" do
    get :show, id: @filled_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filled_form
    assert_response :success
  end

  test "should update filled_form" do
    put :update, id: @filled_form, filled_form: { data: @filled_form.data, form_id: @filled_form.form_id, student_id: @filled_form.student_id }
    assert_redirected_to filled_form_path(assigns(:filled_form))
  end

  test "should destroy filled_form" do
    assert_difference('FilledForm.count', -1) do
      delete :destroy, id: @filled_form
    end

    assert_redirected_to filled_forms_path
  end
end
