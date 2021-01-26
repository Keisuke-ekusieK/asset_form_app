class AssetAllocationsController < ApplicationController
	before_action :logged_in_user, only: [:create, :edit, :update]

  def new
		@asset_allocation = current_user.build_asset_allocation if logged_in? 
  end

	def show
		@asset_allocation = current_user.build_asset_allocation if logged_in? 
	end

	def create
		@asset_allocation = current_user.build_asset_allocation(asset_allocation_params)
    if @asset_allocation.save
      flash[:success] = "資産配分を登録しました"
      redirect_to current_user
    else
      render 'new'
    end
	end
	
	def edit
		@asset_allocation = current_user.asset_allocation
	end

	def update
		@asset_allocation = current_user.asset_allocation
    if @asset_allocation.update(asset_allocation_params)
      flash[:success] = "資産配分を更新しました"
      redirect_to current_user
    else
      render 'edit'
    end
	end

  private
    def asset_allocation_params
      params.require(:asset_allocation).permit(:domestic_currency_deposits,
																							 :foreign_currency_deposits,
																							 :domestic_stocks,
																							 :foreign_stocks,
																							 :domestic_bonds,
																							 :foreign_bonds,
																							 :real_estate,
																							 :gold,
																							 :insurance,
																							 :others)
    end
end
