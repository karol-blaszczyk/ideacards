class AddColorToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :color, :string
  end
end
