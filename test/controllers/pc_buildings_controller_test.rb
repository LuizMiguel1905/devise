require "test_helper"

class PcBuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pc_building = pc_buildings(:one)
  end

  test "should get index" do
    get pc_buildings_url
    assert_response :success
  end

  test "should get new" do
    get new_pc_building_url
    assert_response :success
  end

  test "should create pc_building" do
    assert_difference("PcBuilding.count") do
      post pc_buildings_url, params: { pc_building: {  } }
    end

    assert_redirected_to pc_building_url(PcBuilding.last)
  end

  test "should show pc_building" do
    get pc_building_url(@pc_building)
    assert_response :success
  end

  test "should get edit" do
    get edit_pc_building_url(@pc_building)
    assert_response :success
  end

  test "should update pc_building" do
    patch pc_building_url(@pc_building), params: { pc_building: {  } }
    assert_redirected_to pc_building_url(@pc_building)
  end

  test "should destroy pc_building" do
    assert_difference("PcBuilding.count", -1) do
      delete pc_building_url(@pc_building)
    end

    assert_redirected_to pc_buildings_url
  end
end
