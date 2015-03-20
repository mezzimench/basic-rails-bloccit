require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all
# Note: by calling 'User.new' instead of 'create',
#we create an instance of User which isn't immediately saved to the database.

#The 'skip_confirmation!' method sets the 'confirmed_at' attribute
#to avoid triggering an confirmation email when the User is saved.

#The 'save' method then saves this User to the database.
# Post.delete_all
# Comment.delete_all

#Create Posts
50.times do 
  Post.create!(
      user: users.sample,
    title: Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    )  
end
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    #user: users.sample, #we have not yet associated User with comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

#Create Advertisements
15.times do
    Advertisement.create!(
    title: Faker::Hacker.say_something_smart, 
    copy: Faker::Lorem.sentence(3, true),
    price: Faker::Commerce.price
    )
end

post = Post.where(title: "My post")
unless post.any?
  Post.create!(
      title: "My post",
      body:   "My body"
  )  
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
    email: 'henry.archer500@gmail.com',
    password: 'helloworld'
    )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"

#This is an update to complete the seed-data assignment:)

