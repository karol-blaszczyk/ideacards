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

# Amount should be a decimal between 0 and 1. Lower means darker
def darken_color(hex_color, amount=0.4)
  hex_color = "#34495e" if hex_color.blank?

  hex_color = hex_color.gsub('#','')
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = (rgb[0].to_i * amount).round
  rgb[1] = (rgb[1].to_i * amount).round
  rgb[2] = (rgb[2].to_i * amount).round
  "#%02x%02x%02x" % rgb
end
  
# Amount should be a decimal between 0 and 1. Higher means lighter
def lighten_color(hex_color, amount=0.6)
  hex_color = "#34495e"  if hex_color.blank?
  hex_color = hex_color.gsub('#','')
  rgb = hex_color.scan(/../).map {|color| color.hex}
  rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
  rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
  rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min
  "#%02x%02x%02x" % rgb
end
	  
end
