require 'test_helper'

class MonthlyExpenseTest < ActiveSupport::TestCase
	
	def setup
		@user = users(:michael)
		@monthly_expense = @user.monthly_expenses.build(year: 2021,
																										month: 1,
																										house: 60000,
																										food: 35000,
																										clothes: 5000,
																										education: 8000,
																										daily_necessities: 3000,
																										car: 10000,
																										medical_treatment: 5000,
																										entertainment: 5000,
																										communication: 2000,
																										social: 10000,
																										insurance: 3000,
																										comment: "楽天モバイルと楽天ひかりに乗り換えて通信費下げました",
																										user_id: @user.id)
	end

	test "should be valid" do
		assert @monthly_expense.valid?
	end

	################
  # test for :year
  ################
  test "year should be present" do
    @monthly_expense.year = nil
    assert_not @monthly_expense.valid?
  end

  test "year should be within the range of 2010 to 2030" do
    @monthly_expense.year = 2009
    assert_not @monthly_expense.valid?
    @monthly_expense.year = 2031
    assert_not @monthly_expense.valid?
  end

	#################
  # test for :month
  #################
  test "month column should be present" do
    @monthly_expense.month = nil
    assert_not @monthly_expense.valid?
  end

  test "month should be within the range of 1 to 12" do
    @monthly_expense.month = 0
    assert_not @monthly_expense.valid?
    @monthly_expense.month = 13
    assert_not @monthly_expense.valid?
  end

	#################
  # test for :house
  #################
  test "house column should be present" do
    @monthly_expense.house = nil
    assert_not @monthly_expense.valid?
  end

  test "housing related expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.house = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.house = 10.5
    assert_not @monthly_expense.valid?
  end

	################
  # test for :food
  ################
  test "food colunm should be present" do
    @monthly_expense.food = nil
    assert_not @monthly_expense.valid?
  end

  test "food expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.food = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.food = 10.5
    assert_not @monthly_expense.valid?
  end

	###################
  # test for :clothes
  ###################
  test "clothes column should be present" do
    @monthly_expense.clothes = nil
    assert_not @monthly_expense.valid?
  end

  test "clothing related costs should be integer and be greater than or equal to 0" do
    @monthly_expense.clothes = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.clothes = 10.5
    assert_not @monthly_expense.valid?
  end

	#####################
  # test for :education
  #####################
  test "education column should be present" do
    @monthly_expense.education = nil
    assert_not @monthly_expense.valid?
  end

  test "educational expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.education = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.education = 10.5
    assert_not @monthly_expense.valid?
  end

	#############################
  # test for :daily_necessities
  #############################
  test "daily_necessities column should be present" do
    @monthly_expense.daily_necessities = nil
    assert_not @monthly_expense.valid?
  end

  test "daily_necessities expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.daily_necessities = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.daily_necessities = 10.5
    assert_not @monthly_expense.valid?
  end

	###############
  # test for :car
  ###############
  test "car column should be present" do
    @monthly_expense.car = nil
    assert_not @monthly_expense.valid?
  end

  test "car related costs should be integer and be greater than or equal to 0" do
    @monthly_expense.car = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.car = 10.5
    assert_not @monthly_expense.valid?
  end

	#############################
  # test for :medical_treatment
  #############################
  test "medical treatment column should be present" do
    @monthly_expense.medical_treatment = nil
    assert_not @monthly_expense.valid?
  end

  test "medical bills should be integer and be greater than or equal to 0" do
    @monthly_expense.medical_treatment = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.medical_treatment = 10.5
    assert_not @monthly_expense.valid?
  end

	#########################
  # test for :entertainment
  #########################
  test "entertainment column should be present" do
    @monthly_expense.entertainment = nil
    assert_not @monthly_expense.valid?
  end

  test "entertainment expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.entertainment = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.entertainment = 10.5
    assert_not @monthly_expense.valid?
  end

	#########################
  # test for :communication
  #########################
  test "communication column should be present" do
    @monthly_expense.communication = nil
    assert_not @monthly_expense.valid?
  end

  test "communication expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.communication = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.communication = 10.5
    assert_not @monthly_expense.valid?
  end

	##################
  # test for :social
  ##################
  test "social column should be present" do
    @monthly_expense.social = nil
    assert_not @monthly_expense.valid?
  end

  test "social expenses should be integer and be greater than or equal to 0" do
    @monthly_expense.social = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.social = 10.5
    assert_not @monthly_expense.valid?
  end

	#####################
  # test for :insurance
  #####################
  test "insurance column should be present" do
    @monthly_expense.insurance = nil
    assert_not @monthly_expense.valid?
  end

  test "insurance fee should be integer and be greater than or equal to 0" do
    @monthly_expense.insurance = -1
    assert_not @monthly_expense.valid?
    @monthly_expense.insurance = 10.5
    assert_not @monthly_expense.valid?
  end

	###################
  # test for :comment
  ###################
  test "comment need not to be present" do
    @monthly_expense.comment = nil
    assert @monthly_expense.valid?
  end

  test "comment length should be less than or equal to 200" do
    @monthly_expense.comment = "a"*200
    assert @monthly_expense.valid?
    @monthly_expense.comment = "a"*201
    assert_not @monthly_expense.valid?
  end

	###################
  # test for :user_id
  ###################
  test "user_id column should be present" do
    @monthly_expense.user_id = nil
    assert_not @monthly_expense.valid?
  end
end
