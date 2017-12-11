class FavoriteMailer < ApplicationMailer
    default from: "tiluser0@gmail.com"
    
    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@young-earth-87494.herokuapp.com>"
        headers["In-Reply-To"] = "<post/#{post.id}@young-earth-87494.herokuapp.com>"
        headers["References"] = "<post/#{post.id}@young-earth-87494.herokuapp.com>"
        
        @user = user
        @post = post
        @comment = comment
        
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
end
