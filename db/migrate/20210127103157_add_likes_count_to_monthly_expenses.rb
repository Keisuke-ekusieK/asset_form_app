class AddLikesCountToMonthlyExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :monthly_expenses, :likes_count, :integer, null: false, default: 0
  end
end
