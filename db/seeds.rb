# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Cleaning database"

Friendship.destroy_all
Comment.destroy_all
Recipe.destroy_all
Meal.destroy_all
User.destroy_all

p "Seeding Users..."
user1 = User.new(username: "rat_chef", first_name: "Remy", last_name: "Oswalt", city: "Paris", country: "France", age: 10, email: "rat_chef@foodies.go", password: "123456")
user2 = User.new(username: "Gustini", first_name: "Gusteau", last_name: "Garrett", city: "Paris", country: "France", age: 132, email: "master_chef@foodies.go", password: "654321")
user3 = User.new(username: "Linguini_likes_food", first_name: "Linguini", last_name: "Romano", city: "Paris", country: "France", age: 22, email: "pasta_chef@foodies.go", password: "123654")
user4 = User.new(username: "Colette_the_cook", first_name: "Colette", last_name: "Garofalo", city: "Paris", country: "France", age: 23, email: "victory_chef@foodies.go", password: "654123")
user5 = User.new(username: "Anton", first_name: "Anton", last_name: "Ego", city: "Paris", country: "France", age: 47, email: "review_chef@foodies.go", password: "321456")
user6 = User.new(username: "Caio_cooks", first_name: "Caio", last_name: "Centeio", city: "Rio de Janeiro", country: "Brazil", age: 26, email: "CFCenteio@gmail.com", password: "111111")
user7 = User.new(username: "Pedro_eats", first_name: "Pedro", last_name: "Zisman", city: "Rio de Janeiro", country: "Brazil", age: 28, email: "pedrobolliger@gmail.com", password: "111111")
user8 = User.new(username: "chef_Alicja", first_name: "Alicja", last_name: "Surzyn", city: "Guadalajara", country: "Mexico", age: 37, email: "alicja.surzyn@gmail.com", password: "111111")
user9 = User.new(username: "wild_walid", first_name: "Walid", last_name: "Majdoubi", city: "Paris", country: "France", age: 34, email: "walid@gmail.com", password: "111111")



file1 = URI.open("https://i.pinimg.com/originals/eb/bf/28/ebbf28303696dd50ccc1a9738bd90556.jpg")
user1.photo.attach(io: file1, filename: "#{user1.username}profile.jpg", content_type: "image/jpg")

file2 = URI.open("https://static.wikia.nocookie.net/movies157/images/9/9a/Gusteau.jpg/revision/latest?cb=20210318215933")
user2.photo.attach(io: file2, filename: "profile.jpg", content_type: "image/jpg")

file3 = URI.open("https://i.pinimg.com/originals/eb/bf/28/ebbf28303696dd50ccc1a9738bd90556.jpg")
user3.photo.attach(io: file3, filename: "profile.jpg", content_type: "image/jpg")

file4 = URI.open("https://64.media.tumblr.com/6626ec4732ac344b8c6e9468afade21a/6c2aed3bca1f580c-df/s1280x1920/bea0acafba44f135fed9032e8f78eba50049d76a.jpg")
user4.photo.attach(io: file4, filename: "profile.jpg", content_type: "image/jpg")

file5 = URI.open("https://media.licdn.com/dms/image/C5612AQEtaPzav6ILVg/article-inline_image-shrink_400_744/0/1593135096999?e=1698883200&v=beta&t=M7kBt18GR00QDauBxL_QtfQUFJ-J2Rm0jIYW-Fv4HB4")
user5.photo.attach(io: file5, filename: "profile.jpg", content_type: "image/jpg")

file6 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694625920/caio_zolisg.jpg")
user6.photo.attach(io: file6, filename: "profile.jpg", content_type: "image/jpg")

file7 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694626149/pedro_dbhspo.jpg")
user7.photo.attach(io: file7, filename: "profile.jpg", content_type: "image/jpg")

file8 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694639862/PXL_20220713_223119004_isp306.jpg")
user8.photo.attach(io: file8, filename: "profile.jpg", content_type: "image/jpg")

file9 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694625568/Screenshot_20230913-095553-742_yxtlcx.png")
user9.photo.attach(io: file9, filename: "profile.png", content_type: "image/png")

user1.save!
user2.save!
user3.save!
user4.save!
user5.save!
user6.save!
user7.save!
user8.save!
user9.save!

p "Seeding Recipes..."

recipe1 = Recipe.new(
  title:"Filet Mignon",
  ingredients:"A Filet Mignon steak of any size",
  instructions:"For a medium steak, we cooked our steak at medium-high heat on the stovetop for around 5 minutes, then flipped, added our butter, and cooked for an additional 3-5 minutes. We then transferred our skillet to a 400° oven and cooked for around 5 minutes. Tip: Check the temperature of your meat before transferring to the oven! That way, you can see how far you are from your desired temperature.",
  caption:"Filet mignon is the smaller tip of tenderloin and one of the most expensive cuts of steak, due to its prized texture and that it's only about 2% of the total animal.",
  user: user1)



file1 = URI.open("https://www.wholesomeyum.com/wp-content/uploads/2022/01/wholesomeyum-Air-Fryer-Filet-Mignon-Recipe-4.jpg")
recipe1.photos.attach([io: file1, filename: "recipe_post.jpg", content_type: "image/jpg"])

recipe2 = Recipe.new(
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
recipe2.photos.attach([io: file2, filename: "recipe_post.png", content_type: "image/png"])


recipe3 = Recipe.new(
  title:"Ratatouille",
  ingredients:"2 eggplants, 6 roma tomatoes, 2 yellow squashes, 2 zucchinis",
  instructions:"The different vegetables should be cooked separately, then combined and cooked slowly together until they attain a smooth, creamy consistency so that each vegetable will taste truly of itself.",
  caption:"My specialty",
  user: user1)

file3 = URI.open("https://assets.unileversolutions.com/recipes-v2/181044.jpg?imwidth=1600")
recipe3.photos.attach([io: file3, filename: "recipe_post.jpg", content_type: "image/jpg"])

recipe1.save!
recipe2.save!
recipe3.save!
# recipe4 = Recipe.create(title:"", ingredients:"", instructions:"", caption:"", user:"")

p "Seeding Meals..."


meal1 = Meal.new(title: "Ratatouille", restaurant: "Gusteau's", caption: "Check it out!", user: user1, address: "168 Rue Montmartre, 75002 Paris, France")
meal2 = Meal.new(title: "Leak and Potato Soup", restaurant: "Gusteau's", caption: "And also this!", user: user1, address: "168 Rue Montmartre, 75002 Paris, France")
meal3 = Meal.new(title: "Chicken", restaurant: "Gusteau's", caption: "Delightful", user: user1, address: "168 Rue Montmartre, 75002 Paris, France")
meal4 = Meal.new(title: "Cheese Tapioca", restaurant: "Barraca da Greicy", caption: "So different and yummy and chewy", user: user7, address: "R. Teixeira de Melo, 32, Rio de Janeiro, Brazil")
meal5 = Meal.new(title: "Moqueca", restaurant: "Restaurant 365", caption: "Delightful moqueca, Bahia style", user: user6, address: "Av. Lúcio Costa, 5210, Rio de Janeiro, Brazil")
meal6 = Meal.new(title: "Oven Baked Pizza", restaurant: "Chris Place", caption: "Super fresh dough and flavorful toppings", user: user8, address: "Buenos Aires 2332, Guadalajara, México")
meal7 = Meal.new(title: "Tostada de Atun", restaurant: "El Zar de Mar", caption: "Freshest seafood in Mexico", user: user9, address: "Pino Suárez 469, El Vigía, Guadalajara, México")
meal8 = Meal.new(title: "Risotto", restaurant: "Casa do Sardo", caption: "Best risotto texture I've ever had", user: user8, address: "R. São Cristóvão, 405, Rio de Janeiro, Brazil")

file1 = URI.open("https://i.ytimg.com/vi/8a51lQaKg4w/maxresdefault.jpg")
meal1.photo.attach(io: file1, filename: "post.jpg", content_type: "image/jpg")

file2 = URI.open("https://food-images.files.bbci.co.uk/food/recipes/leekandpotatosoup_1920_16x9.jpg")
meal2.photo.attach(io: file2, filename: "post.jpg", content_type: "image/jpg")

file3 = URI.open("https://www.eatingwell.com/thmb/O0rxCl7gJhIbmH-_unoCvP1CtAw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1501p108-weeknight-lemon-chicken-skillet-dinner-8030728-4x3-1-2000-b74e47f2bfd64b7fb6ca174ce7313ac6.jpg")
meal3.photo.attach(io: file3, filename: "post.jpg", content_type: "image/jpg")

file4 = URI.open("https://assets.delirec.com/images%2FmH5j8dGV2dTtfN2muR5MQaC7NOs1%2Frecipe%2Fe7558840-5ee7-4dcb-8b0d-a35497d2565d-Tapioca-com-recheio-de-frango-e-queijo--gallery-0")
meal4.photo.attach(io: file4, filename: "post.jpg", content_type: "image/jpg")

file5 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694626146/PXL_20230819_015746247_g0ggrg.jpg")
meal5.photo.attach(io: file5, filename: "post.jpg", content_type: "image/jpg")

file6 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694626210/IMG-20221231-WA0040_sgdlay.jpg")
meal6.photo.attach(io: file6, filename: "post.jpg", content_type: "image/jpg")

file7 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694626144/PXL_20230404_230856666_hm3afb.jpg")
meal7.photo.attach(io: file7, filename: "post.jpg", content_type: "image/jpg")

file8 = URI.open("https://res.cloudinary.com/dk8ykeiqh/image/upload/v1694626143/IMG-20221223-WA0039_u6hgco.jpg")
meal8.photo.attach(io: file8, filename: "post.jpg", content_type: "image/jpg")

meal1.save!
meal2.save!
meal3.save!
meal4.save!
meal5.save!
meal6.save!
meal7.save!
meal8.save!
# meal3 = Meal.create(title: "", restaurant:"", caption: "", latitude: "", longitude: "", user:)

p "Seeding complete!"
