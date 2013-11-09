class ChangeTimeAndCacheForIdeas < ActiveRecord::Migration
  def change
  	change_column :ideas, :time, :string
  	change_column :ideas, :cash, :string
  end
end
