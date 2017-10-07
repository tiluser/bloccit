require 'random_data'

# Create posts
50.times do
    # #1
    Post.create!(
        # #2
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
end
posts = Post.all
    
# Create comments
# #3
100.times do
    Comment.create!(
    # #4
    post: posts.sample,
    body: RandomData.random_paragraph
    )
end

# Create special post


post_fbt = Post.find_by(title: 'This is the special post')
if post_fbt == nil
    Post.create!(
        title: "This is the special post",
        body: "The body has special data"
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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"