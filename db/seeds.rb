# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Cleaning database"
User.destroy_all
Recipe.destroy_all

p "Seeding users..."
user1 = User.create(username: "Remy", first_name: "Patton" , last_name: "Oswalt" , city: "Paris" , country: "France" , age: , email: "rat_chef@foodies.go" , password: "123456")
user2 = User.create(username: "Gusteau", first_name: "Brad" , last_name: "Garrett" , city: "Paris" , country: "France" , age: , email: "master_chef@foodies.go" , password: "654321")
user3 = User.create(username: "Linguini", first_name: "Lou" , last_name: "Romano" , city: "Paris" , country: "France" , age: , email: "pasta_chef@foodies.go" , password: "123654")
user4 = User.create(username: "Colette", first_name: "Janeane" , last_name: "Garofalo" , city: "Paris" , country: "France" , age: , email: "victory_chef@foodies.go" , password: "654123")
user5 = User.create(username: "Django", first_name: "Brian" , last_name: "Dennehy" , city: "Paris" , country: "France" , age: , email: "review_chef@foodies.go" , password: "321456")

p "Seeding Recipes..."
recipes1 = Recipe.create(
  title:"Filet Mignon",
  ingredients:"A Filet Mignon steak of any size",
  instructions:"For a medium steak, we cooked our steak at medium-high heat on the stovetop for around 5 minutes, then flipped, added our butter, and cooked for an additional 3-5 minutes. We then transferred our skillet to a 400° oven and cooked for around 5 minutes. Tip: Check the temperature of your meat before transferring to the oven! That way, you can see how far you are from your desired temperature.",
  caption:"Filet mignon is the smaller tip of tenderloin and one of the most expensive cuts of steak, due to its prized texture and that it's only about 2% of the total animal.",
  user: user1)

recipe2 = Recipe.create(
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

recipe3 = Recipe.create(
  title:"Ratatouille",
  ingredients:"2 eggplants, 6 roma tomatoes, 2 yellow squashes, 2 zucchinis",
  instructions:"The different vegetables should be cooked separately, then combined and cooked slowly together until they attain a smooth, creamy consistency so that each vegetable will taste truly of itself.",
  caption:"My specialty",
  user: user1)

recipe4 = Recipe.create(title:"", ingredients:"", instructions:"", caption:"", user:"")
recipe5 = Recipe.create(title:"", ingredients:"", instructions:"", caption:"", user:"")

p "Seeding Meals..."

p "Seeding complete!"
