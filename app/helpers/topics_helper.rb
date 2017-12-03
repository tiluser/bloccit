module TopicsHelper
    def user_is_authorized_for_topic_updates?
        (current_user && current_user.admin?) || (current_user &&current_user.moderator?)
    end
    
    def user_is_authorized_for_topics_all?
        (current_user && current_user.admin?)
    end
end
