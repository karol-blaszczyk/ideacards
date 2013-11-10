class Idea < ActiveRecord::Base
  acts_as_votable
  belongs_to :category
  has_attached_file :picture, 
    :styles => { :medium => "218x126>", :thumb => "100x100>" },
    :default_url => "http://placehold.it/300x300&text=IDEA"

  validates_attachment_size :picture, :in => 0.megabytes..2.megabytes
  extend FriendlyId
  friendly_id :name, use: :slugged

  TIMES = [{value: "< 15min", image: "0px 0px"}, {value: "< 30min", image: "0px 120px"}, {value: "> 30min", image: "0px 60px"}]
  PLACEMENTS = [{value: "DOM", image: "120px 180px"}, {value: "ZEW.", image: "120px 120px"}, {value: "INNE", image: "120px 60px"}]
  CASH = [{value: "FREE", image: "180px 180px"}, {value: "< 20zł", image: "180px 120px"}, {value: "> 20zł", image: "180px 60px"}]
  GROUP = [{value: "1 osoba", image: "-60px 180px"}, {value: "2 osoby", image: "-60px 120px"}, {value: "> 2 osoby", image: "-60px 60px"}]

  COLORS = [["TURQUOISE","#1ABC9C"],["EMERALD","#2ECC71"],["PETER RIVER", "#3498DB"],["AMETHYST", "#9B59B6"],
            ["SUN FLOWER", "#F1C40F"],["CARROT","#E67E22"]]


  FRONT_COLORS = [["#1ABC9C","#16A085"],["#F1C40F","#F39C12"],
                  ["#2ECC71","#27AE60"],["#E67E22","#D35400"],
                  ["#3498DB","#2980B9"],["#9B59B6","#8E44AD"]]

end
