# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Cleaning database"
Recipe.destroy_all
Meal.destroy_all
User.destroy_all

p "Seeding Users..."
user1 = User.create!(username: "Remy", first_name: "Remy", last_name: "Oswalt", city: "Paris", country: "France", age: 10, email: "rat_chef@foodies.go", password: "123456")
user2 = User.create!(username: "Gusteau", first_name: "Gusteau", last_name: "Garrett", city: "Paris", country: "France", age: 132, email: "master_chef@foodies.go", password: "654321")
user3 = User.create!(username: "Linguini", first_name: "Linguini", last_name: "Romano", city: "Paris", country: "France", age: 22, email: "pasta_chef@foodies.go", password: "123654")
user4 = User.create!(username: "Colette", first_name: "Colette", last_name: "Garofalo", city: "Paris", country: "France", age: 23, email: "victory_chef@foodies.go", password: "654123")
user5 = User.create!(username: "Anton", first_name: "Anton", last_name: "Ego", city: "Paris", country: "France", age: 47, email: "review_chef@foodies.go", password: "321456")

file1 = URI.open("https://ih1.redbubble.net/image.999574152.6606/flat,750x1000,075,f.jpg")
user1.photo.attach(io: file1, filename: "#{user1.username}profile.png", content_type: "image/png")

file2 = URI.open("https://static.wikia.nocookie.net/movies157/images/9/9a/Gusteau.jpg/revision/latest?cb=20210318215933")
user2.photo.attach(io: file2, filename: "profile.png", content_type: "image/png")

file3 = URI.open("https://i.pinimg.com/originals/eb/bf/28/ebbf28303696dd50ccc1a9738bd90556.jpg")
user3.photo.attach(io: file3, filename: "profile.png", content_type: "image/png")

file4 = URI.open("https://64.media.tumblr.com/6626ec4732ac344b8c6e9468afade21a/6c2aed3bca1f580c-df/s1280x1920/bea0acafba44f135fed9032e8f78eba50049d76a.jpg")
user4.photo.attach(io: file4, filename: "profile.png", content_type: "image/png")

file5 = URI.open("https://media.licdn.com/dms/image/C5612AQEtaPzav6ILVg/article-inline_image-shrink_400_744/0/1593135096999?e=1698883200&v=beta&t=M7kBt18GR00QDauBxL_QtfQUFJ-J2Rm0jIYW-Fv4HB4")
user5.photo.attach(io: file5, filename: "profile.png", content_type: "image/png")

p "Seeding Recipes..."

recipe1 = Recipe.create!(
  title:"Filet Mignon",
  ingredients:"A Filet Mignon steak of any size",
  instructions:"For a medium steak, we cooked our steak at medium-high heat on the stovetop for around 5 minutes, then flipped, added our butter, and cooked for an additional 3-5 minutes. We then transferred our skillet to a 400° oven and cooked for around 5 minutes. Tip: Check the temperature of your meat before transferring to the oven! That way, you can see how far you are from your desired temperature.",
  caption:"Filet mignon is the smaller tip of tenderloin and one of the most expensive cuts of steak, due to its prized texture and that it's only about 2% of the total animal.",
  user: user1)



file1 = URI.open("https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2023/02/Filet-Mignon-main.jpg")
recipe1.photos.attach(io: file1, filename: "recipe_post.png", content_type: "image/png")

recipe2 = Recipe.create!(
  title:"Romeo and Juliet Cheesecake",
  ingredients:"1 ¼ cup maria cookie crumbs, ¼ cup butter melted, 750g cream cheese, ½ cup sugar, 2 tsp vanilla extract, 3 eggs, 300-400g guava paste",
  instructions:"Pre-heat oven to 325°F (165°C). Line the bottom (circle) and sides (long strip, optional) of a 9-inch (23 cm) springform pan with parchment paper.
    Combine butter with cookie crumbs and press to the bottom of the prepared pan.
    Beat cream cheese, sugar and vanilla with mixer until blended. Add eggs, 1 at a time, mixing on slowly after each addition just until incorporated. Do not overmix or whip.
    Pour cream cheese mixture over crust. Bake 50 to 55 minutes, or until the center is almost set but still looks a bit jiggly.
    Remove from the oven. Loosen cheesecake from rim of pan; let cool before removing rim. Refrigerate cheesecake for 3-4 hours before adding the topping.
    Cut guava paste into smaller pieces and add to a microwave-safe dish. Add water and microwave on high for 3 minutes, stir, heat for another 2 minutes, stir and repeat until all pieces are dissolved (or use a saucepan on the stovetop instead of the microwave). The mixture should be creamy and smooth. Depending on the consistency of the guava paste, a bit more water may be needed (add 1 extra tbsp at a time, careful not to make the mixture too runny).
    To make the guava topping even creamier and less sweet, add the thick cream (optional) and mix until incorporated.
    Remove pan bottom (and paper) and transfer the cooled cheesecake to a serving dish. Spread the guava topping over it, letting it run down the sides. Refrigerate until ready to serve.",
  caption:"One of my faves from Brazil is a simple dessert known as 'Romeo and Juliet', or cheese with guava paste. Here I share these flavours in cheesecake form!",
  user: user1)


file2 = URI.open("https://www.daninoce.com.br/wp-content/uploads/2017/09/cheesecake-romeu-e-julieta-1.png")
recipe2.photos.attach(io: file2, filename: "recipe_post.png", content_type: "image/png")


recipe3 = Recipe.create!(
  title:"Ratatouille",
  ingredients:"2 eggplants, 6 roma tomatoes, 2 yellow squashes, 2 zucchinis",
  instructions:"The different vegetables should be cooked separately, then combined and cooked slowly together until they attain a smooth, creamy consistency so that each vegetable will taste truly of itself.",
  caption:"My specialty",
  user: user1)

file3 = URI.open("https://assets.unileversolutions.com/recipes-v2/181044.jpg?imwidth=1600")
recipe3.photos.attach(io: file3, filename: "recipe_post.png", content_type: "image/png")

# recipe4 = Recipe.create(title:"", ingredients:"", instructions:"", caption:"", user:"")

p "Seeding Meals..."


meal1 = Meal.create!(title: "Ratatouille", restaurant:"Gusteau's", caption: "Check it out!", lat: "48.87085038918666", long: "2.343018048001365", user: user1)
meal2 = Meal.create!(title: "Leak and Potato Soup", restaurant:"Gusteau's", caption: "And also this!", lat: "48.87085038918666,", long: "2.343018048001365", user: user1)
meal3 = Meal.create!(title: "Chicken", restaurant:"Gusteau's", caption: "Delightful", lat: "48.87085038918666", long: "2.343018048001365", user: user1)


file1 = URI.open("https://i.ytimg.com/vi/8a51lQaKg4w/maxresdefault.jpg")
meal1.photo.attach(io: file1, filename: "post.png", content_type: "image/png")

file2 = URI.open("https://food-images.files.bbci.co.uk/food/recipes/leekandpotatosoup_1920_16x9.jpg")
meal2.photo.attach(io: file2, filename: "post.png", content_type: "image/png")

file3 = URI.open("https://www.eatingwell.com/thmb/O0rxCl7gJhIbmH-_unoCvP1CtAw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1501p108-weeknight-lemon-chicken-skillet-dinner-8030728-4x3-1-2000-b74e47f2bfd64b7fb6ca174ce7313ac6.jpg")
meal3.photo.attach(io: file3, filename: "post.png", content_type: "image/png")

# meal3 = Meal.create(title: "", restaurant:"", caption: "", lat: "", long: "", user:)

p "Seeding complete!"
