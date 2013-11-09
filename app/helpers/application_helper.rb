module ApplicationHelper

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end  

	def image(element)
		element.picture.url(:medium) || "http://www.placehold.it/150x150/EFEFEF/AAAAAA"
	end

  def short_body(element)
    text= ActionView::Base.full_sanitizer.sanitize(element.description).html_safe.gsub(/&nbsp;/i," ")
    truncate(
      (strip_tags strip_links simple_format text), length: 255)
  end

  def shorter_body(element)
    text= ActionView::Base.full_sanitizer.sanitize(element.description).html_safe.gsub(/&nbsp;/i," ")
    truncate(
      (strip_tags strip_links simple_format text), length: 50)
  end  
	  
end
