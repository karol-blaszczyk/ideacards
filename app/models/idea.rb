class Idea < ActiveRecord::Base
  belongs_to :category
  has_attached_file :picture, 
    :styles => { :medium => "218x126>", :thumb => "100x100>" },
    :default_url => "http://placehold.it/300x300&text=IDEA"

  validates_attachment_size :picture, :in => 0.megabytes..2.megabytes
  extend FriendlyId
  friendly_id :name, use: :slugged

  TIMES = [{value: "< 15min", image: ""}, {value: "< 30min", image: ""}, {value: "> 30min", image: ""}]
  PLACEMENTS = [{value: "DOM", image: ""}, {value: "ZEW.", image: ""}, {value: "INNE", image: ""}]
  CASH = [{value: "FREE", image: ""}, {value: "< 20zł", image: ""}, {value: "> 20zł", image: ""}]
  GROUP = [{value: "1 osoba", image: ""}, {value: "2 osoby", image: ""}, {value: "> 2 osoby", image: ""}]
  COLORS = [["TURQUOISE","#1ABC9C"],["EMERALD","#2ECC71"],["NEPHRITIS" , "#27AE60"],["PETER RIVER", "#3498DB"],["BELIZE HOLE" ,"#2980B9"],["AMETHYST", "#9B59B6"],["WISTERIA", "#8E44AD"],
            ["WET ASPHALT", "#34495E"],["MIDNIGHT BLUE", "#2C3E50"],["SUN FLOWER", "#F1C40F"],["ORANGE","#F39C12"],["CARROT","#E67E22"],
            ["PUMPKIN","#D35400"],["ALIZARIN","#E74C3C"],["POMEGRANATE","#C0392B"]]

end
