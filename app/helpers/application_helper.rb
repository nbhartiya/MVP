module ApplicationHelper
	
	def link_to_remove_fields(name, f)
		f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
	end

	def link_to_add_fields(name, f, association)
		# This function doesn't work properly, make sure to fix if you ever use it. 
		# Leaving it here because adding / removing fields may be useful later.
		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
			render(association.to_s.singularize + "_fields", :f => builder)
		end
		link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
	end
	def is_user_there_and_following(followabletype, followableid)
		if user_signed_in?
	    	current_user.follows_this?(followabletype, followableid)
	    else
	       false
	    end	
	end
end