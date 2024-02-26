require "application_system_test_case"

class PcBuildingsTest < ApplicationSystemTestCase
  setup do
    @pc_building = pc_buildings(:one)
  end

  test "visiting the index" do
    visit pc_buildings_url
    assert_selector "h1", text: "Pc buildings"
  end

  test "should create pc building" do
    visit pc_buildings_url
    click_on "New pc building"

    click_on "Create Pc building"

    assert_text "Pc building was successfully created"
    click_on "Back"
  end

  test "should update Pc building" do
    visit pc_building_url(@pc_building)
    click_on "Edit this pc building", match: :first

    click_on "Update Pc building"

    assert_text "Pc building was successfully updated"
    click_on "Back"
  end

  test "should destroy Pc building" do
    visit pc_building_url(@pc_building)
    click_on "Destroy this pc building", match: :first

    assert_text "Pc building was successfully destroyed"
  end
end
