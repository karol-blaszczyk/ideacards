class ChanngeIdeas < ActiveRecord::Migration
  def change
  	remove_reference :ideas, :placement
  	remove_reference :ideas, :social_categories
  	drop_table :placements
  	drop_table :social_categories
  	add_column :ideas, :placement, :string
  	add_column :ideas, :group, :string
  end
end
