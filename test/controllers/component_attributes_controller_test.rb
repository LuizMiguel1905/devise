require "test_helper"

class ComponentAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @component_attribute = component_attributes(:one)
  end

  test "should get index" do
    get component_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_component_attribute_url
    assert_response :success
  end

  test "should create component_attribute" do
    assert_difference("ComponentAttribute.count") do
      post component_attributes_url, params: { component_attribute: { brand: @component_attribute.brand, cpuSupport: @component_attribute.cpuSupport, memory: @component_attribute.memory, memoryLimit: @component_attribute.memoryLimit, memorySlot: @component_attribute.memorySlot, video: @component_attribute.video } }
    end

    assert_redirected_to component_attribute_url(ComponentAttribute.last)
  end

  test "should show component_attribute" do
    get component_attribute_url(@component_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_component_attribute_url(@component_attribute)
    assert_response :success
  end

  test "should update component_attribute" do
    patch component_attribute_url(@component_attribute), params: { component_attribute: { brand: @component_attribute.brand, cpuSupport: @component_attribute.cpuSupport, memory: @component_attribute.memory, memoryLimit: @component_attribute.memoryLimit, memorySlot: @component_attribute.memorySlot, video: @component_attribute.video } }
    assert_redirected_to component_attribute_url(@component_attribute)
  end

  test "should destroy component_attribute" do
    assert_difference("ComponentAttribute.count", -1) do
      delete component_attribute_url(@component_attribute)
    end

    assert_redirected_to component_attributes_url
  end
end
