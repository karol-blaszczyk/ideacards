class AddAtachchementToSocialCategory < ActiveRecord::Migration
  def change
  	add_attachment :social_categories, :picture
  end
end
