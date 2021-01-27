class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update, :index, :following, :followers]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy

	def index
		if params[:q]
      @users = User.search_by_keyword(params[:q])
                        .paginate(page: params[:page], per_page: 10)
    else
			@users = User.paginate(page: params[:page], per_page: 10)
		end
	end

	def show
		@user = User.find(params[:id])
		#@monthly_expense = current_user.monthly_expenses.build if logged_in?
		@family = @user.family
		@asset_allocation = @user.asset_allocation
		if not @asset_allocation.nil?
			@asset_allocation_for_graph = {'国内通貨預金' => @asset_allocation.domestic_currency_deposits,
																	 '海外通貨預金' => @asset_allocation.foreign_currency_deposits,
																	 '国内株式'     => @asset_allocation.domestic_stocks,
																	 '海外株式'    => @asset_allocation.foreign_stocks,
																	 '国内債券'    => @asset_allocation.domestic_bonds,
																	 '海外債券'    => @asset_allocation.foreign_bonds,
																	 '不動産'      => @asset_allocation.real_estate,
																	 '金'         => @asset_allocation.gold,
																	 '保険'       => @asset_allocation.insurance,
																	 'その他'     => @asset_allocation.others}
		end
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
			redirect_to new_family_url 
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "プロフィールを更新しました"
      redirect_to @user		
		else
			render 'edit'
		end
	end

	def destroy
    delete_user = User.find(params[:id])
		delete_user.destroy
    flash[:success] = "#{delete_user.name}を消去しました"
    redirect_to users_url
  end

		private
			def user_params
      	params.require(:user).permit(:avatar, 
																		 :name, 
																		 :email,
																		 :user_name,  
																		 :password,
                	                   :password_confirmation)
    	end

			def admin_user
				redirect_to(root_url) unless current_user.admin?
			end

			def correct_user
    		@user = User.find(params[:id])
    		redirect_to(root_url) unless current_user?(@user)
  		end
end
