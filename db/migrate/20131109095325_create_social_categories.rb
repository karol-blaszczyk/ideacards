class CreateSocialCategories < ActiveRecord::Migration
  def change
    create_table :social_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
