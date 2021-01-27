class AddIndexToMonthlyExpenseYearMonthUserid < ActiveRecord::Migration[6.0]
  def change
		add_index :monthly_expenses, [:year, :month, :user_id], unique: true
  end
end
