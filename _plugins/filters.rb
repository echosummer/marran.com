module Jekyll

  module Filters
  
    def fetch_content_from(url)
    
      require 'open-uri'
    
      # open-uri RDoc: http://stdlib.rubyonrails.org/libdoc/open-uri/rdoc/index.html
      open(url) { |f| return f.read }
    
    end
	
    def time_ago(date)
      "<script>document.write($.timeago(\"#{date.strftime('%m-%d-%y')}\"))</script>"
    end
		
		def format_youtube(url)
			matches = url.scan /(?:v=|embed\/)([^&]*)/
			if matches[0] 
				"<iframe title=\"YouTube video player\" width=\"480\" height=\"390\" src=\"http://www.youtube.com/embed/#{matches[0]}\" frameborder=\"0\" allowfullscreen></iframe>"
			end
		end
		
		def format_photo(url)
			"<div class=\"post-image\"><a href=\"#{url}\" rel=\"shadowbox\"><img src=\"#{url}\" /></a></div>"
		end
		
		def format_main_image(p)
			url = p['fullsize'] ? p['fullsize'] : p
		end
	
		def format_teaser_image(p)			
			url = p['thumbnail'] ? p['thumbnail'] : p
		end
	
	end

end