User.create!(
  name:  "User1",
  email: "a@b.com",
  password: "12345678",
  password_confirmation: "12345678"
)

99.times do |n|
  name  = Faker::Name.name
  email = "user-#{n+1}@gmail.org"
  password = "password123"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

# Tweets
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.tweets.create!(body: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
