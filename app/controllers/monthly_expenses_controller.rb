class MonthlyExpensesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@monthly_expense = current_user.monthly_expenses.build(monthly_expense_params)
		
		if @monthly_expense.already_registered?
			flash[:danger] = "#{@monthly_expense.year}年#{@monthly_expense.month}月の支出は既に登録されています"
			redirect_to current_user
		else
    	if @monthly_expense.save
      	flash[:success] = "#{@monthly_expense.year}年#{@monthly_expense.month}月の支出を登録しました"
      	redirect_to current_user
    	else
      	flash[:danger] = "失敗しました"
      	redirect_to current_user
    	end
		end
	end

	def destroy
		delete_monthly_expense = MonthlyExpense.find_by(id: params[:id])
		if delete_monthly_expense && current_user?(delete_monthly_expense.user)
			delete_monthly_expense.destroy
    	flash[:success] = "支出記録を1件消去しました"
    	redirect_to current_user
		else
			redirect_to current_user
		end
	end

	private

		def monthly_expense_params
			params.require(:monthly_expense).permit(:year, 
																							:month, 
																							:house, 
																							:food, 
																							:clothes, 
																							:education, 
																							:daily_necessities, 
																							:car, 
																							:medical_treatment, 
																							:entertainment, 
																							:social, 
																							:communication, 
																							:insurance, 
																							:comment)
		end
end
