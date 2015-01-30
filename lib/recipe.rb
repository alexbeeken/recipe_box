class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:categories)


  define_method(:update_ingredients) do |ingredients|

    ingredients.each() do |ingredient|
      if (self.ingredients().include?(ingredient))
      else
        self.ingredients() << (ingredient)
      end
    end

    self.ingredients.each() do |ingredient|
      if ingredients.include?(ingredient)
      else
        self.ingredients.delete(ingredient)
      end
    end

  end

  define_method(:update_categories) do |categories|

    categories.each() do |category|
      if (self.categories().include?(category))
      else
        self.categories() << (category)
      end
    end

    self.categories.each() do |category|
      if categories.include?(category)
      else
        self.categories.delete(category)
      end
    end
  end


end
