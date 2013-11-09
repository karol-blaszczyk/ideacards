class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.references :category, index: true
      t.integer :time
      t.references :social_category, index: true
      t.integer :cash


      t.timestamps
    end
    add_attachment :ideas, :picture
  end
end
