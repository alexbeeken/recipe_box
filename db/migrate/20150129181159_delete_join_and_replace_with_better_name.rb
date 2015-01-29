class DeleteJoinAndReplaceWithBetterName < ActiveRecord::Migration
  def change
    drop_table(:recipes_ingredients)

    create_table :ingredients_recipes do |t|
      t.belongs_to :recipes, index: true
      t.belongs_to :ingredients, index: true
    end
  end
end
