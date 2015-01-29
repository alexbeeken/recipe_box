class CreateTablesRecpiesIngredients < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:title, :string)
      t.column(:instructions, :string)
      t.timestamps
    end

    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
      t.timestamps
    end

    create_table :recipes_ingredients do |t|
      t.belongs_to :recipes, index: true
      t.belongs_to :ingredients, index: true
    end
  end
end
