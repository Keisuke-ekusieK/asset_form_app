class FamiliesController < ApplicationController
  def new
		@family = current_user.build_family if logged_in?
  end

  def edit
		@family = current_user.family
  end

  def show
		@family = current_user.build_family if logged_in?
  end

	def create
		@family = current_user.build_family(family_params)
		if @family.save
			flash[:success] = "世帯構成を登録しました"
			#if current_user.asset_allocation.nil?
			#	redirect_to new_asset_allocation_url 
			#else
			redirect_to current_user
			#end
		else
			render 'new'
		end
	end

	def update
		@family = current_user.family
    if @family.update(family_params)
      flash[:success] = "世帯構成を更新しました"
      redirect_to current_user 
    else
      render 'edit'
    end
	end

	private
		def family_params
			params.require(:family).permit(:spouse, :children, :parent, :worker)
		end
end
