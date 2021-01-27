class LikesController < ApplicationController
	before_action :logged_in_user

  def create
    @monthly_expense = MonthlyExpense.find(params[:monthly_expense_id])
    @monthly_expense.good(current_user)
  end

  def destroy
    @monthly_expense = Like.find(params[:id]).monthly_expense
    @monthly_expense.not_good(current_user)
  end
end
