class StaticPagesController < ApplicationController
	def home
		if logged_in?
			@user = current_user
			@monthly_expense = current_user.monthly_expenses.build if logged_in?
    	@family = current_user.family
    	@asset_allocation = current_user.asset_allocation
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
			if params[:q]
        @monthly_expenses = MonthlyExpense.search_by_keyword(params[:q])
                        .paginate(page: params[:page], per_page: 10)
      else
				@monthly_expenses = current_user.feed.paginate(page: params[:page], per_page: 10)
      end
		end
  end
end
