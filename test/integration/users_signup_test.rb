require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	test "invalid account information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
																				 user_name: "",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

	test "valid account information and invalid family information" do
		get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
																				 user_name: "example_user",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'families/new'
		assert_select 'a[href=?]', new_asset_allocation_path, count: 1, text: "今はスキップ"
		assert_no_difference 'Family.count' do
			post family_path, params: { family: { spouse: false,
																						children: -1,
																						parent: 5,
																						worker: -3 } }
		end
		assert_template 'families/new'
	end

	test "valid account and family information, and invalid asset allocation information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post users_path, params: { user: { name:  "Example User",
                                       	 email: "user@example.com",
																			 	 user_name: "example_user",
                                       	 password:              "password",
                                       	 password_confirmation: "password" } }
		end
		follow_redirect!
		assert_template 'families/new'
		assert_select 'a[href=?]', new_asset_allocation_path, count: 1, text: "今はスキップ"
		assert_difference 'Family.count', 1 do
			post family_path, params: { family: { spouse: true,
																						children: 3,
																						parent: 0,
																						worker: 2 } }
		end
		follow_redirect!
		assert_template 'asset_allocations/new'
		assert_no_difference 'AssetAllocation.count' do
			post asset_allocation_path, params: { asset_allocation: { domestic_currency_deposits: -1,
																																foreign_currency_deposits: 0.5,
																																domestic_stocks: -1,
																																foreign_stocks: -1,
																																domestic_bonds: -1,
																																foreign_bonds: -1,
																																real_estate: -1,
																																gold: -1,
																																insurance: -1,
																																others: -1 } }
		end
		assert_template 'asset_allocations/new'
	end	

	test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
																				 user_name: "example_user",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'families/new'
		assert_not flash.nil?
		assert_difference 'Family.count', 1 do
			post family_path, params: { family: { spouse: true,
																								children: 2,
																								parent: 2,
																								worker: 2 } }
		end
		follow_redirect!
		assert_template 'asset_allocations/new'
		assert_not flash.nil?
		assert_difference 'AssetAllocation.count', 1 do
			post asset_allocation_path, params: { asset_allocation: { domestic_currency_deposits: 200,
																																foreign_currency_deposits: 200,
																																domestic_stocks: 500,
																																foreign_stocks: 1000,
																																domestic_bonds: 300,
																																foreign_bonds: 300,
																																real_estate: 1000,
																																gold: 300,
																																insurance: 0,
																																others: 100 } }
		end
		follow_redirect!
		assert_template 'users/show'
		assert_not flash.nil?
		assert is_logged_in?
  end
end
