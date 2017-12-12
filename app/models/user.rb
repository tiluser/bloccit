 class User < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
 
    before_save {  cap_name if name.present? }
    before_save { self.email = email.downcase if email.present? }
    before_save { self.role ||= :member }

    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true

    validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

    has_secure_password
    
    enum role: [:member, :admin, :moderator]
    
    def cap_name
        if self.name != nil
            self.name = GenUtils.cap_name(self.name)
        end
    end
    
    def favorite_for(post)
        favorites.where(post_id: post.id).first
    end
    
    def avatar_url(size)
        gravatar_id = Digest::MD5::hexdigest(self.email).downcase
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end

 end