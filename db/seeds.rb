require 'random_data'
1.times do
    User.create!(
        name:    "Joseph M. O'Connor",
        email:   "tiluser0@gmail.com",
        password: "helloworld"
    )
    User.create!(
        name:     'Member User',
        email:    'member@example.com',
        password: 'helloworld'
    )
    User.create!(
        name:     'Admin User',
        email:    'admin@example.com',
        password: 'helloworld',
        role:     'admin'        
    )
    
    User.create!(
        name:     'Moderator User',
        email:    'moderator@example.com',
        password: 'helloworld',
        role:     'moderator'        
    )

end

4.times do
    User.create!(
        name:    RandomData.random_name,
        email:   RandomData.random_email,
        password: RandomData.random_sentence
    )
end

users = User.all

15.times do
    Topic.create!(
        name:         RandomData.random_sentence,
        description:  RandomData.random_paragraph
    )
 end
 topics = Topic.all

# Create posts
50.times do
    post = Post.create!(
        user:  users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
        
    post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
    rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
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
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
    )
end

user = users.first

user.name = "Joseph M. O'Connor"
user.email = "tiluser0@gmail.com"
user.password = "helloworld"

# Create special post
post_fbt = Post.find_by(title: 'This is the special post')
if post_fbt == nil
    Post.create!(
        user: user,
        topic: topics[0],
        title: "This is the special post",
        body: "The body has special data"
    )
end

cmt_fbt = Comment.find_by(body: "The body has special comment data")
post_fbt = Post.find_by(title: 'This is the special post')
if cmt_fbt == nil
    Comment.create!(
        user: users[0],
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
puts "#{Vote.count} votes created"



