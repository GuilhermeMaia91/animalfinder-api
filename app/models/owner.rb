class Owner < ApplicationRecord
    has_many :animals, :dependent => :delete_all

    has_secure_password
    validates :name, presence: true
    validates :password, presence: true, length: {minimum: 6}, on: :create
    validates :email, presence: true, uniqueness: true
    validates :celfone, presence: true, length: {minimum: 10}
    before_save { self.email.downcase! }
end
