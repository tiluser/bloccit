class User < ApplicationRecord
# #2
    before_save {  cap_name if name.present? }
    before_save { self.email = email.downcase if email.present? }

# #3
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# #4
    validates :password_digest, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password_digest, length: { minimum: 6 }, allow_blank: true
    
# #5
    validates :email, presence: true,
              uniqueness: { case_sensitive: false },
              length: { minimum: 3, maximum: 254 }
              
# #6
    has_secure_password

    def cap_name
        if self.name != nil
            self.name = GenUtils.cap_name(self.name)
        end
    end

end
