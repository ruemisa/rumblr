require 'bcrypt'

class User < ActiveRecord::Base
    include BCrypt 

    def password 
        @password ||= Password.new(password_hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end
    has_many :posts
end

class Post < ActiveRecord::Base
    belongs_to :user
end


# #comments
# belongs_to :post, :user

# #posts
# belongs_to :user
# has_many :comments

# #users 
# has_many :posts, :comments

# '%d-%m-%Y'

# , :foreign_key => 'user_id'