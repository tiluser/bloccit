class User < ApplicationRecord
# #2
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
end
