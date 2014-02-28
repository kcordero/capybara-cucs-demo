module ApplicationHelper

	def flash_message
		f = Marshal.load(Marshal.dump(flash))
		flash.clear
	  f.map do |key, msg|
	    content_tag :div, msg, :id => key, :class => 'flash'
	  end.join

	end
	
end
