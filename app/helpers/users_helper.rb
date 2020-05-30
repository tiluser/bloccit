module UsersHelper
    def user_has_posts?
        if @user.posts.count > 0 
            true
        else
            false
        end
    end
    
    def user_has_favorited_posts?
        favorited_count = 0
        @user.posts.each do |post|
            if current_user.favorite_for(post)
                favorited_count += 1
            end
        end
        if favorited_count > 0 
            true
        else
            false
        end
    end

end
