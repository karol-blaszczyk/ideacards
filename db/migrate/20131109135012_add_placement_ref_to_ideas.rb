class AddPlacementRefToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :placement, index: true
  end
end
