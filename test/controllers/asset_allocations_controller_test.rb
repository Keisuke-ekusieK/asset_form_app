require 'test_helper'

class AssetAllocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_asset_allocation_url
    assert_response :success
  end

	test "should redirect create when not logged in" do
    assert_no_difference 'AssetAllocation.count' do
      post asset_allocation_path, params: { asset_allocation: { domestic_currency_deposits: 100,
                                    														foreign_currency_deposts: 200,
                                    														domestic_stocks: 1000,
                                    														foreign_stocks: 1000,
																																domestic_bonds: 100,
																																foreign_bonds: 100,
																																real_estate: 1000,
																																gold: 100,
																																insurance: 0,
																																others: 100 } }
    end
    assert_redirected_to login_url
  end
end
