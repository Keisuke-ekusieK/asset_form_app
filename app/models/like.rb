class Like < ApplicationRecord
	belongs_to :user
  belongs_to :monthly_expense
	counter_culture :monthly_expense
  validates :user_id, presence: true
  validates :monthly_expense_id, presence: true
end
