class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true, format: {with: /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/, message: "Please enter a valid email"}
	validates :phone, presence: true, format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Please enter a valid french number" }
	has_many :reservations, foreign_key: "guest_id", class_name: "Reservation"
	has_many :houses, foreign_key: "admin_id", class_name: "House"
end
