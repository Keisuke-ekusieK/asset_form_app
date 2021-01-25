module ApplicationHelper
	def full_title(page_title="")
		if page_title.nil?
			page_title = "資産形成アプリ"
		else
			page_title = "#{page_title} | 資産形成アプリ"
		end
	end
end
