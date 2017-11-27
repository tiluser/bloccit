require 'random_data'
5.times do
    User.create!(
        name:    RandomData.random_name,
        email:   RandomData.random_email,
        password: RandomData.random_sentence
    )
end
users = User.all

i = 0
5.times do 
    print users[i].name
    i +=1
end

15.times do
    Topic.create!(
        name:         RandomData.random_sentence,
        description:  RandomData.random_paragraph
    )
 end
 topics = Topic.all

# Create posts
50.times do
    Post.create!(
        user:  users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end
posts = Post.all

# Create sponsored posts
50.times do
    SponsoredPost.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: RandomData.random_price
        )
end
posts = Post.all
#sponsored_posts = SponsoredPost.all
    
# Create comments
# #3
100.times do
    Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
    )
end

# Create special post
post_fbt = Post.find_by(title: 'This is the special post')
if post_fbt == nil
    Post.create!(
        topic: topics[0],
        title: "This is the special post",
        body: "The body has special data"
    )
end

user = Users.first

user.name = "Joseph M. O'Connor"
user.email = "tiluser0@gmail.com"
user.password = "helloworld"

cmt_fbt = Comment.find_by(body: "The body has special comment data")
post_fbt = Post.find_by(title: 'This is the special post')
if cmt_fbt == nil
    Comment.create!(
        user: user,
        post: post_fbt,
        body: "The body has special comment data"
    )
end

post_index = 1
last_index = Post.last.id
while post_index <= last_index
    post_fbt = Post.find(post_index)
    post_fbt.title = "SPAM"
    post_fbt.save
    if post_index == 1
        post_index +=4
    else
        post_index += 5
    end
end

posts = Post.all

# Create advertisements
50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: RandomData.random_price
        )
end

# Create questions
50.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: RandomData.random_resolved
        )     
end

cmt_fbt = Comment.find_by(body: "The body has special comment data")
post_fbt = Post.find_by(title: 'This is the special post')
if cmt_fbt == nil
    Comment.create!(
        user: user,
        post: post_fbt,
        body: "The body has special comment data"
    )
end

post_index = 1
last_index = Post.last.id
while post_index <= last_index
    post_fbt = Post.find(post_index)
    post_fbt.title = "SPAM"
    post_fbt.save
    if post_index == 1
        post_index +=4
    else
        post_index += 5
    end
end

posts = Post.all

# Create advertisements
50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: RandomData.random_price
        )
end

# Create questions
50.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: RandomData.random_resolved
        )     
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
puts "#{Question.count} questions created"



