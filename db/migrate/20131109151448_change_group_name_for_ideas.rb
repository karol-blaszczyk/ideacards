class ChangeGroupNameForIdeas < ActiveRecord::Migration
  def change
  	rename_column :ideas, :group, :group_type
  end
end
