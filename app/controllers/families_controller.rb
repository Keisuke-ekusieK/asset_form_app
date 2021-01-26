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
end
