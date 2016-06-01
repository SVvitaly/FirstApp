class User < ActiveRecord::Base
 validates :first_name, :last_name, presence: { message: "is not present" }, length: { maximum: 50,
    too_long: "is too long" }
 validates :username, presence: { message: "is not present" }, length: { maximum: 50,
    too_long: "is too long" }, uniqueness: true
 validates :email, presence: { message: "is not present" }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },  uniqueness: true
 validates :phone_number, presence: { message: "is not present" }, format: { with: /\A\d{3}-\d{2}-\d{3}-\d{2}-\d{2}\z/}, uniqueness: true 
end              
 