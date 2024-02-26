require "application_system_test_case"

class ComponentAttributesTest < ApplicationSystemTestCase
  setup do
    @component_attribute = component_attributes(:one)
  end

  test "visiting the index" do
    visit component_attributes_url
    assert_selector "h1", text: "Component attributes"
  end

  test "should create component attribute" do
    visit component_attributes_url
    click_on "New component attribute"

    fill_in "Brand", with: @component_attribute.brand
    fill_in "Cpusupport", with: @component_attribute.cpuSupport
    fill_in "Memory", with: @component_attribute.memory
    fill_in "Memorylimit", with: @component_attribute.memoryLimit
    fill_in "Memoryslot", with: @component_attribute.memorySlot
    check "Video" if @component_attribute.video
    click_on "Create Component attribute"

    assert_text "Component attribute was successfully created"
    click_on "Back"
  end

  test "should update Component attribute" do
    visit component_attribute_url(@component_attribute)
    click_on "Edit this component attribute", match: :first

    fill_in "Brand", with: @component_attribute.brand
    fill_in "Cpusupport", with: @component_attribute.cpuSupport
    fill_in "Memory", with: @component_attribute.memory
    fill_in "Memorylimit", with: @component_attribute.memoryLimit
    fill_in "Memoryslot", with: @component_attribute.memorySlot
    check "Video" if @component_attribute.video
    click_on "Update Component attribute"

    assert_text "Component attribute was successfully updated"
    click_on "Back"
  end

  test "should destroy Component attribute" do
    visit component_attribute_url(@component_attribute)
    click_on "Destroy this component attribute", match: :first

    assert_text "Component attribute was successfully destroyed"
  end
end
