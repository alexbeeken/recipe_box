class ReplaceColumnNamesInJoinTable < ActiveRecord::Migration
  def change

    change_table(:ingredients_recipes) do |t|
      t.rename(:ingredients_id, :ingredient_id)
      t.rename(:recipes_id, :recipe_id)
    end

  end
end
