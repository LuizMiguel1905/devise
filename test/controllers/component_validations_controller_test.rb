require "test_helper"

class ComponentValidationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_validation = component_validations(:one)
  end

  test "should get index" do
    get component_validations_url
    assert_response :success
  end

  test "should get new" do
    get new_component_validation_url
    assert_response :success
  end

  test "should create component_validation" do
    assert_difference("ComponentValidation.count") do
      post component_validations_url, params: { component_validation: { componentType: @component_validation.componentType } }
    end

    assert_redirected_to component_validation_url(ComponentValidation.last)
  end

  test "should show component_validation" do
    get component_validation_url(@component_validation)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_validation_url(@component_validation)
    assert_response :success
  end

  test "should update component_validation" do
    patch component_validation_url(@component_validation), params: { component_validation: { componentType: @component_validation.componentType } }
    assert_redirected_to component_validation_url(@component_validation)
  end

  test "should destroy component_validation" do
    assert_difference("ComponentValidation.count", -1) do
      delete component_validation_url(@component_validation)
    end

    assert_redirected_to component_validations_url
  end
end
