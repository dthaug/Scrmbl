module ApplicationHelper

include Milestone

	#Returns the full title on a per-page basis
	def full_title(page_title)
		base_title = "ScrambleBox"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
    end
end
