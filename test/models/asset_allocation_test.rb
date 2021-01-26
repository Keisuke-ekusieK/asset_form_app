require 'test_helper'

class AssetAllocationTest < ActiveSupport::TestCase
	
	def setup
		@user = users(:michael)
		@asset_allocation = @user.build_asset_allocation(domestic_currency_deposits: 1000000,
																										 foreign_currency_deposits:  2000000,
																										 domestic_stocks:            2000000,
																										 foreign_stocks:             3000000,
																										 domestic_bonds:             1000000,
																										 foreign_bonds:              1000000,
																										 real_estate:                5000000,
																										 gold:                       1000000,
																										 insurance:                   100000,
																										 others:                     1000000,
																										 user_id:                   @user.id)
	end

	test "shold be valid" do
		assert @asset_allocation.valid?
	end

	######################################
	# test for :domestic_currency_deposits
	######################################
	test "domestic_currency_deposits should by present" do
		@asset_allocation.domestic_currency_deposits = nil
		assert_not @asset_allocation.valid?
	end
	
	test "domestic_currency_deposits should be greater than or equal to 0" do
		@asset_allocation.domestic_currency_deposits = -10
		assert_not @asset_allocation.valid?
	end

	######################################
	# test for :foreign_currency_deposits
	######################################
	test "foreign_currency_deposits should by present" do
		@asset_allocation.foreign_currency_deposits = nil
		assert_not @asset_allocation.valid?
	end

	test "foreign_currency_deposits should be greater than or equal to 0" do
		@asset_allocation.foreign_currency_deposits = -10
		assert_not @asset_allocation.valid?
	end

	###########################
	# test for :domestic_stocks
	###########################
	test "domestic_stocks should by present" do
		@asset_allocation.domestic_stocks = nil
		assert_not @asset_allocation.valid?
	end

	test "domestic_stocks should be greater than or equal to 0" do
		@asset_allocation.domestic_stocks = -10
		assert_not @asset_allocation.valid?
	end

	##########################
	# test for :foreign_stocks
	##########################
	test "foreign_stocks should by present" do
		@asset_allocation.foreign_stocks = nil
		assert_not @asset_allocation.valid?
	end

	test "foreign_stocks should be greater than or equal to 0" do
		@asset_allocation.foreign_stocks = -10
		assert_not @asset_allocation.valid?
	end

	##########################
	# test for :domestic_bonds
	##########################
	test "domestic_bonds should by present" do
		@asset_allocation.domestic_bonds = nil
		assert_not @asset_allocation.valid?
	end

	test "domestic_bonds should be greater than or equal to 0" do
		@asset_allocation.domestic_bonds = -10
		assert_not @asset_allocation.valid?
	end

	#########################
	# test for :foreign_bonds
	#########################
	test "foreign_bonds should by present" do
		@asset_allocation.foreign_bonds = nil
		assert_not @asset_allocation.valid?
	end

	test "foreign_bonds should be greater than or equal to 0" do
		@asset_allocation.foreign_bonds = -10
		assert_not @asset_allocation.valid?
	end

	#######################
	# test for :real_estate
	#######################
	test "real_estate should by present" do
		@asset_allocation.real_estate = nil
		assert_not @asset_allocation.valid?
	end

	test "real_estate should be greater than or equal to 0" do
		@asset_allocation.real_estate = -10
		assert_not @asset_allocation.valid?
	end

	################
	# test for :gold
	################
	test "gold should by present" do
		@asset_allocation.gold = nil
		assert_not @asset_allocation.valid?
	end

	test "gold should be greater than or equal to 0" do
		@asset_allocation.gold = -10
		assert_not @asset_allocation.valid?
	end

	#####################
	# test for :insurance
	#####################
	test "insurance should by present" do
		@asset_allocation.insurance = nil
		assert_not @asset_allocation.valid?
	end

	test "insurance should be greater than or equal to 0" do
		@asset_allocation.insurance = -10
		assert_not @asset_allocation.valid?
	end

	##################
	# test for :others
	##################
	test "others should by present" do
		@asset_allocation.others = nil
		assert_not @asset_allocation.valid?
	end

	test "others should be greater than or equal to 0" do
		@asset_allocation.others = -10
		assert_not @asset_allocation.valid?
	end
end
