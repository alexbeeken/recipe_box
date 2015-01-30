require("bundler/setup")
Bundler.require(:default)
also_reload("/lib/**/*.rb")
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get '/' do
  @recipes = Recipe.all()
  @ingredients = Ingredient.all()
  @categories = Category.all()
  erb(:index)
end

get '/recipe/:id' do
  @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:recipe)
end

get '/recipe/:id/edit' do
  @edit = true
  @recipe = Recipe.find(params.fetch("id").to_i)
  @ingredients = @recipe.ingredients
  @categories = Category.all()
  erb(:recipe_form)
end

get '/ingredient/:id' do
  erb(:ingredient)
end

get '/new_recipe' do
  @edit = false
  @ingredients = Ingredient.all()
  @categories = Category.all()
  erb(:recipe_form)
end

post '/recipe_add' do
  title = params.fetch("title")
  instructions = params.fetch("instructions")
  ingredient_ids = params.fetch("ingredients")
  recipe = Recipe.create({:title => title, :instructions => instructions})
  ingredient_ids.each() do |id|
    recipe.ingredients() << Ingredient.find(id.to_i())
  end
  category_ids = params.fetch("categories")
  category_ids.each() do |id|
    recipe.categories() << Category.find(id.to_i())
  end
  redirect '/'
end

patch '/recipe_edit' do
  recipe = Recipe.find(params.fetch("id").to_i)
  title = params.fetch("title")
  instructions = params.fetch("instructions")
  recipe.update({:title => title, :instructions => instructions})

  ingredient_ids = params.fetch("ingredients")
  ingredients = []
  ingredient_ids.each() do |id|
    ingredients.push(Ingredient.find(id.to_i()))
  end
  recipe.update_ingredients(ingredients)

  category_ids = params.fetch("categories")
  categories = []
  category_ids.each() do |id|
    categories.push(Category.find(id.to_i()))
  end
  recipe.update_categories(categories)
  redirect '/'
end

post '/add_ingredient' do
  name = params.fetch("name")
  Ingredient.create({:name => name})
  redirect('/')
end

post '/add_category' do
  name = params.fetch("name")
  Category.create({:name => name})
  redirect '/'
end

get '/category/:id' do
  @category = Category.find(params.fetch("id").to_i())
  erb(:category)
end

post '/add_ingredient_recipe_form' do
  name = params.fetch("name")
  Ingredient.create({:name => name})
  redirect('/new_recipe')
end

post '/add_category_recipe_form' do
  name = params.fetch("name")
  Category.create({:name => name})
  redirect('/new_recipe')
end
