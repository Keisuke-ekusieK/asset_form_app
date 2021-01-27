require 'test_helper'

class MonthlyExpensesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@michael = users(:michael)
    @michael_monthly_expense = monthly_expenses(:one)
		@archer_monthly_expense = monthly_expenses(:three)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'MonthlyExpense.count' do
      post monthly_expenses_path, params: { monthly_expense: { year: 2020,
																															 month: 12,
  																														 house: 50000,
  																														 food: 30000,
  																														 clothes: 3000,
  																														 education: 8000,
  																														 daily_necessities: 3000,
  																														 car: 8000,
  																														 medical_treatment: 5000,
  																														 entertainment: 10000,
  																														 communication: 5000,
  																														 social: 20000,
  																														 insurance: 5000,
  																														 comment: "がんばりました" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'MonthlyExpense.count' do
      delete monthly_expense_path(@michael_monthly_expense)
    end
    assert_redirected_to login_url
  end

  test "should not destroy for wrong monthly_expense" do
    log_in_as(@michael)
    assert_no_difference 'MonthlyExpense.count' do
      delete monthly_expense_path(@archer_monthly_expense)
    end
    assert_redirected_to @michael
  end
	
	test "should destroy for right monthly_expense" do
		log_in_as(@michael)
		assert_difference 'MonthlyExpense.count', -1 do
			delete monthly_expense_path(@michael_monthly_expense)
		end
		assert_not flash.empty?
		assert_redirected_to @michael
	end
end
