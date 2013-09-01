module ApplicationHelper

<<<<<<< HEAD
	include Milestone

=======
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
>>>>>>> 5cd8ed10911b1e37a98f0635ad6202893d2ab629
end
