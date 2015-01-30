require("rspec")

describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:categories) }

  describe('#update_ingredients') do
    it 'adds new, leaves same and deletes old ingredients from a recipe' do
      test_recipe = Recipe.new({:title => "Pea Soup", :instructions => "Cook"})
      test_ingredient0 = Ingredient.create({:name => "peas"})
      test_ingredient1 = Ingredient.create({:name => "salt"})
      test_recipe.ingredients << test_ingredient0
      test_recipe.ingredients << test_ingredient1
      test_ingredients = []
      test_ingredients.push(test_ingredient1)
      test_ingredient2 = Ingredient.create({:name => "potatoes"})
      test_ingredients.push(test_ingredient2)
      test_recipe.update_ingredients(test_ingredients)
      expect(test_recipe.ingredients).to(eq([test_ingredient1, test_ingredient2]))
    end
  end

  describe('#update_categories') do
    it 'adds new, leaves same and deletes old categories from a recipe' do
      test_recipe = Recipe.new({:title => "Pea Soup", :instructions => "Cook"})
      test_category0 = Category.create({:name => "peas"})
      test_category1 = Category.create({:name => "salt"})
      test_recipe.categories << test_category0
      test_recipe.categories << test_category1
      test_categories = []
      test_categories.push(test_category1)
      test_category2 = Category.create({:name => "potatoes"})
      test_categories.push(test_category2)
      test_recipe.update_categories(test_categories)
      expect(test_recipe.categories).to(eq([test_category1, test_category2]))
    end
  end
end
