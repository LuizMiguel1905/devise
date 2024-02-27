require "application_system_test_case"

class BuildersTest < ApplicationSystemTestCase
  setup do
    @builder = builders(:one)
  end

  test "visiting the index" do
    visit builders_url
    assert_selector "h1", text: "Builders"
  end

  test "should create builder" do
    visit builders_url
    click_on "New builder"

    fill_in "Clientname", with: @builder.clientName
    click_on "Create Builder"

    assert_text "Builder was successfully created"
    click_on "Back"
  end

  test "should update Builder" do
    visit builder_url(@builder)
    click_on "Edit this builder", match: :first

    fill_in "Clientname", with: @builder.clientName
    click_on "Update Builder"

    assert_text "Builder was successfully updated"
    click_on "Back"
  end

  test "should destroy Builder" do
    visit builder_url(@builder)
    click_on "Destroy this builder", match: :first

    assert_text "Builder was successfully destroyed"
  end
end
