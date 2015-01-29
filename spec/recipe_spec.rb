require("rspec")

describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients) }
end
