class Family < ApplicationRecord
  belongs_to :user

	validates :user_id,  presence: true
	validates :spouse,   presence: false,
											 inclusion: { in: [true, false] }
	validates :children, presence: true,
											 numericality: { only_integer: true,
																			 greater_than_or_equal_to: 0,
																			 less_than_or_equal_to: 20 }
	validates :parent,   presence: true,
											 numericality: { only_integer: true,
																			 greater_than_or_equal_to: 0,
																			 less_than_or_equal_to: 4 }
	validates :worker,   presence: true,
											 numericality: { only_integer: true,
																			 greater_than_or_equal_to: 0 }
end
