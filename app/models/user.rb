class User < ApplicationRecord
    has_secure_password


    validated :email, presence: true, uniqueness: true
end
