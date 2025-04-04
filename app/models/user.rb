class User < ApplicationRecord
    before_validation { self.email = email.downcase }                          # changes email to downcase
    has_many :articles, dependent: :destroy                         # dependent: :destroy - means data dependencies will be removed as well         
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    
    validates :email, presence: true,                               # mandatory field
                      uniqueness: { case_sensitive: false },        # unique
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }           # format to follow VALID_EMAIL_REGEX
    has_secure_password 
end