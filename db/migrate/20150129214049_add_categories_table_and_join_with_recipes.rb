class AddCategoriesTableAndJoinWithRecipes < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :string)
      t.timestamps
    end

    create_table :categories_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
