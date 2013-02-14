module Utils

def generate_scale(progress, width, total_items)

	returnhtml = ""
	step_value = total_items/5;

	for i in 0..5 do
		returnhtml += content_tag(:div, "#{step_value*i}", class: "milestonecaption", style: "left: #{10+(((width-40)/5)*i)}px")+"\n"
	end
	returnhtml += content_tag(:p,"", style: "height: 8px; margin: 0px")+"\n"

	scalemarks = "";

	for i in 0..5 do
		scalemarks += content_tag(:div, "", class: "scalemark", style: "left: #{20+(((width-40)/5)*i)}px")+"\n"
	end

	returnhtml += content_tag(:div, scalemarks.html_safe, class: "scale-tb2")+"\n"
	returnhtml += content_tag(:p,"", style: "height: 6px; margin: 0px")+"\n"

	return returnhtml
end

def generate_milestone_bars(progress, users_required, width, total_items)

	returnvalue = content_tag(:div, "", class: "box1")

	users_required.each_index { |x| 
		returnvalue += content_tag(:div, "" , class: "target", id: "milestonemark#{x+1}", style: "left: #{Integer((Float(width-40)/Float(total_items))*Float(users_required[x]))}px")+"\n"
	}

	progress.each_index { |x| 
		returnvalue += content_tag(:div, "#{Integer((Float(width-40)/Float(total_items))*Float(progress[x]))}", class: "msbar", id: "milestonebar#{x+1}", style: "width: 0px")+"\n"
	}

	returnvalue = content_tag(:div, returnvalue.html_safe, class: "box-wrap")+"\n"
end

def generate_milestone_indicators(users_required, width, total_items, milestone_texts)

	returnvalue = ""

	users_required.each_index { |x| 
		content = content_tag(:span, "", class: "icon", id: "milestoneicon#{x+1}")+"\n"
		content += content_tag(:span, milestone_texts[x], class: "mstext")+"\n"
		unless (Integer((Float(width-40)/Float(total_items))*Float(users_required[x]))+14)+90 > width
			returnvalue += content_tag(:li, content.html_safe , class: "milestone", style: "left: #{Integer((Float(width-40)/Float(total_items))*Float(users_required[x]))+14}px")+"\n"
		else
			returnvalue += content_tag(:li, content.html_safe , class: "milestone", style: "left: #{width-90}px")+"\n"
		end
	}

	returnvalue = content_tag(:ul, returnvalue.html_safe, class: "milestones")+"\n"

end

def generate_graph_legend(progress, users_required, milestone_texts, total_items)

	current_milestone = "No sale"
	next_milestone = milestone_texts[progress.length-1]
	number_of_bids = progress[progress.length-1]
	bids_until_next_milestone = total_items

	progress.each_index { |x|
		if bids_until_next_milestone<=0
			bids_until_next_milestone = total_items
		end

		if progress[x] >= users_required[x]
			current_milestone = milestone_texts[x]
		end

		if bids_until_next_milestone > users_required[x] - progress[x]
				bids_until_next_milestone = users_required[x] - progress[x]
				next_milestone = milestone_texts[x]
		end
	}

	bids = content_tag(:li, (content_tag(:strong, "#{number_of_bids}", id: "bids")+"Number of bids").html_safe, class: "graphpoint")+"\n"
	cmilestone = content_tag(:li, (content_tag(:strong, current_milestone, id: "bids")+"Current milestone").html_safe, class: "graphpoint")+"\n"
	
	if(bids_until_next_milestone>0)
		buntil = content_tag(:li, (content_tag(:strong, "#{bids_until_next_milestone}", id: "bids")+"Bids until next milestone").html_safe, class: "graphpoint")+"\n"
	else
		next_milestone = "-"
		buntil = content_tag(:li, (content_tag(:strong, "-", id: "bids")+"Bids until next milestone").html_safe, class: "graphpoint")+"\n"
	end
	nmilestone = content_tag(:li, (content_tag(:strong, next_milestone, id: "bids")+"Next milestone").html_safe, class: "graphpoint")+"\n"
	glegend = content_tag(:ul, bids.html_safe+cmilestone.html_safe+nmilestone.html_safe+buntil.html_safe, id: "graphlegend")+"\n"

	wrapper = content_tag(:div, glegend.html_safe, id: "graphwrapper")+"\n"
	return wrapper.html_safe
end

def milestone_bar(progress, users_required, total_items, milestone_texts, options = {})

	width = options[:width] || 500

	content = generate_scale(100,width,total_items).html_safe
	content += generate_milestone_bars(progress, users_required, width, total_items)
	content += generate_milestone_indicators(users_required, width, total_items, milestone_texts)
	content += generate_graph_legend(progress, users_required, milestone_texts, total_items)

	return content_tag(:div, content.html_safe, id: "container", style: "width:#{width}px")
end

end