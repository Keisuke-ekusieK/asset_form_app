require 'test_helper'

class AssetAllocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get asset_allocations_new_url
    assert_response :success
  end

  test "should get show" do
    get asset_allocations_show_url
    assert_response :success
  end

  test "should get edit" do
    get asset_allocations_edit_url
    assert_response :success
  end

end
