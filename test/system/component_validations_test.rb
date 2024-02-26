require "application_system_test_case"

class ComponentValidationsTest < ApplicationSystemTestCase
  setup do
    @component_validation = component_validations(:one)
  end

  test "visiting the index" do
    visit component_validations_url
    assert_selector "h1", text: "Component validations"
  end

  test "should create component validation" do
    visit component_validations_url
    click_on "New component validation"

    fill_in "Componenttype", with: @component_validation.componentType
    click_on "Create Component validation"

    assert_text "Component validation was successfully created"
    click_on "Back"
  end

  test "should update Component validation" do
    visit component_validation_url(@component_validation)
    click_on "Edit this component validation", match: :first

    fill_in "Componenttype", with: @component_validation.componentType
    click_on "Update Component validation"

    assert_text "Component validation was successfully updated"
    click_on "Back"
  end

  test "should destroy Component validation" do
    visit component_validation_url(@component_validation)
    click_on "Destroy this component validation", match: :first

    assert_text "Component validation was successfully destroyed"
  end
end
