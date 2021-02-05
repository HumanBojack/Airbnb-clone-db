class House < ApplicationRecord
	validates :avaliable_beds, presence: true, numericality: {greater_than: 0}
	validates :price, presence: true, numericality: {greater_than: 0}
	validates :description, presence: true, length: {minimum: 140}
	validates :welcome_message, presence: true
	belongs_to :admin, class_name: "User"
	belongs_to :city
	has_many :reservations, dependent: :destroy
end
# h = House.create(avaliable_beds: 3, price: 13, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam volutpat ante sit amet mattis egestas. Quisque varius ornare efficitur vel.", has_wifi: true, welcome_message: "Salut", city: c, user: u)