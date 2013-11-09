class SocialCategory < ActiveRecord::Base

  has_attached_file :picture, 
    :styles => { :medium => "218x126>", :thumb => "100x100>" },
    :default_url => "http://placehold.it/300x300&text=IDEA"

  validates_attachment_size :picture, :in => 0.megabytes..2.megabytes
  extend FriendlyId
  friendly_id :name, use: :slugged
end
