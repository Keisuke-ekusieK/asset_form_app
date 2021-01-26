class AssetAllocation < ApplicationRecord
  belongs_to :user

	validates :domestic_currency_deposits, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :foreign_currency_deposits, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :domestic_stocks, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :foreign_stocks, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :domestic_bonds, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :foreign_bonds, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :foreign_bonds, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :real_estate, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :gold, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :insurance, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :others, presence: true,
																				 numericality: { only_integer: true,
																												 greater_than_or_equal_to: 0 }																				 
	validates :user_id, presence: true
	
	def sum
		domestic_currency_deposits+foreign_currency_deposits+domestic_stocks+foreign_stocks+domestic_bonds+foreign_bonds+real_estate+gold+insurance+others
	end
end
