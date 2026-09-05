user1 = User.create(name: 'Sahal')
user2 = User.create(name: 'Ahmad')
user3 = User.create(name: 'Phelelani')
user4 = User.create(name: 'Nasir')
user5 = User.create(name: 'Abel')

recipe1 = Recipe.create(name: 'Spaghetti Bolognese', preparation_time: 35, cooking_time: 50, description: 'A classic Italian dish with rich meat sauce served over spaghetti.', user: user1)
recipe2 = Recipe.create(name: 'Chicken Alfredo', preparation_time: 25, cooking_time: 30, description: ' Creamy Alfredo sauce tossed with tender chicken and fettuccine pasta.', user: user2)
recipe3 = Recipe.create(name: 'Beef Stir-Fry', preparation_time: 15, cooking_time: 20, description: 'Quick and delicious stir-fried beef with vegetables and soy sauce.', user: user3)
recipe4 = Recipe.create(name: 'Margherita Pizza', preparation_time: 10, cooking_time: 15, description: 'A simple yet classic pizza topped with tomatoes, mozzarella, and basil.', user: user4)
recipe5 = Recipe.create(name: 'Vegetable Curry', preparation_time: 20, cooking_time: 35, description: 'A flavorful vegetarian curry with a variety of colorful vegetables and aromatic spices.', user: user5)
recipe6 = Recipe.create(name: 'Grilled Salmon', preparation_time: 10, cooking_time: 15, description: 'A healthy and delicious grilled salmon dish with a lemon and herb marinade.', user: user1)
recipe7 = Recipe.create(name: 'Caesar Salad', preparation_time: 15, cooking_time: 0, description: 'A classic Caesar salad with crisp romaine lettuce, croutons, and creamy dressing.', user: user2)
recipe8 = Recipe.create(name: 'Shrimp Scampi', preparation_time: 20, cooking_time: 15, description: 'Succulent shrimp sautéed with garlic, butter, and white wine, served over pasta.', user: user3)
recipe9 = Recipe.create(name: 'Vegetarian Lasagna', preparation_time: 30, cooking_time: 45, description: ' Layers of pasta, ricotta cheese, vegetables, and marinara sauce make this vegetarian lasagna a hearty meal.', user: user4)
recipe10 = Recipe.create(name: 'Chocolate Cake', preparation_time: 20, cooking_time: 30, description: 'A moist and decadent chocolate cake topped with creamy frosting.', user: user5)

# Recipe1 - Spaghetti Bolognese
food1 = Food.create(
  name: 'Ground Beef',
  measurement_unit: 'grams',
  price: 8.99,
  quantity: 250,
  user: user1
)

# Recipe2 - Chicken Alfredo
food2 = Food.create(
  name: 'Boneless Chicken Breast',
  measurement_unit: 'pieces',
  price: 4.99,
  quantity: 4, # Assuming 2 pieces for each recipe
  user: user2
)

# Recipe3 - Beef Stir-Fry
food3 = Food.create(
  name: 'Broccoli',
  measurement_unit: 'grams',
  price: 3.99,
  quantity: 200,
  user: user3
)

# Recipe4 - Margherita Pizza
food4 = Food.create(
  name: 'Mozzarella Cheese',
  measurement_unit: 'grams',
  price: 5.99,
  quantity: 150,
  user: user4
)

# Recipe5 - Vegetable Curry
food5 = Food.create(
  name: 'Bell Peppers',
  measurement_unit: 'pieces',
  price: 2.49,
  quantity: 3,
  user: user5
)

# Recipe6 - Grilled Salmon
food6 = Food.create(
  name: 'Salmon Fillet',
  measurement_unit: 'grams',
  price: 12.99,
  quantity: 200,
  user: user1
)

# Recipe7 - Caesar Salad
food7 = Food.create(
  name: 'Romaine Lettuce',
  measurement_unit: 'grams',
  price: 1.99,
  quantity: 150,
  user: user2
)

# Recipe8 - Shrimp Scampi
food8 = Food.create(
  name: 'Shrimp',
  measurement_unit: 'grams',
  price: 9.99,
  quantity: 200,
  user: user3
)

# Recipe9 - Vegetarian Lasagna
food9 = Food.create(
  name: 'Ricotta Cheese',
  measurement_unit: 'grams',
  price: 6.99,
  quantity: 250,
  user: user4
)

# Recipe10 - Chocolate Cake
food10 = Food.create(
  name: 'Chocolate',
  measurement_unit: 'grams',
  price: 3.49,
  quantity: 200,
  user: user5
)

# Recipe1 - Spaghetti Bolognese
RecipeFood.create(recipe: recipe1, food: food1, quantity: 250)

# Recipe2 - Chicken Alfredo
RecipeFood.create(recipe: recipe2, food: food2, quantity: 2)

# Recipe3 - Beef Stir-Fry
RecipeFood.create(recipe: recipe3, food: food3, quantity: 200)

# Recipe4 - Margherita Pizza
RecipeFood.create(recipe: recipe4, food: food4, quantity: 150)

# Recipe5 - Vegetable Curry
RecipeFood.create(recipe: recipe5, food: food5, quantity: 3)

# Recipe6 - Grilled Salmon
RecipeFood.create(recipe: recipe6, food: food6, quantity: 200)

# Recipe7 - Caesar Salad
RecipeFood.create(recipe: recipe7, food: food7, quantity: 150)

# Recipe8 - Shrimp Scampi
RecipeFood.create(recipe: recipe8, food: food8, quantity: 200)

# Recipe9 - Vegetarian Lasagna
RecipeFood.create(recipe: recipe9, food: food9, quantity: 250)

# Recipe10 - Chocolate Cake
RecipeFood.create(recipe: recipe10, food: food10, quantity: 200)
