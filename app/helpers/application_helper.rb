module ApplicationHelper
	def full_title(title = "")
		base_title = "Members Only Microposting"
		if title.blank?
			base_title
		else
			"#{title} | #{base_title}"
		end
	end
end
