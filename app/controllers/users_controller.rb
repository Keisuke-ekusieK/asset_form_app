class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		#@monthly_expense = current_user.monthly_expenses.build if logged_in?
		#@family = @user.family
		#@asset_allocation = @user.asset_allocation
		#if not @asset_allocation.nil?
		#	@asset_allocation_for_graph = {'国内通貨預金' => @asset_allocation.domestic_currency_deposits,
		#															 '海外通貨預金' => @asset_allocation.foreign_currency_deposits,
		#															 '国内株式'     => @asset_allocation.domestic_stocks,
		#															 '海外株式'    => @asset_allocation.foreign_stocks,
		#															 '国内債券'    => @asset_allocation.domestic_bonds,
		#															 '海外債券'    => @asset_allocation.foreign_bonds,
		#															 '不動産'      => @asset_allocation.real_estate,
		#															 '金'         => @asset_allocation.gold,
		#															 '保険'       => @asset_allocation.insurance,
		#															 'その他'     => @asset_allocation.others}
		#end
		#@monthly_expenses = @user.monthly_expenses.paginate(page: params[:page], per_page: 10)
	end

  def new
		@user = User.new
  end

	def create
		@user = User.new(user_params)
		@user.avatar.attach(params[:user][:avatar])
		if @user.save
			log_in @user
			flash[:success] = "アカウント情報を登録しました"
			#redirect_to new_family_url 
		else
			render 'new'
		end
	end
end
