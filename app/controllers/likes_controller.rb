class LikesController < ApplicationController
	before_action :logged_in_user

	def create
    @monthly_expense = MonthlyExpense.find(params[:monthly_expense_id])
    unless @monthly_expense.good?(current_user)
      @monthly_expense.good(current_user)
			@monthly_expense.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @monthly_expense = Like.find(params[:id]).monthly_expense
    if @monthly_expense.good?(current_user)
      @monthly_expense.not_good(current_user)
			@monthly_expense.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
