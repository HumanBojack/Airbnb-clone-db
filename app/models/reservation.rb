class Reservation < ApplicationRecord
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :guest, presence: true
	validates :house, presence: true
	validate :end_before_start
	validate :is_overlaping?
	def end_before_start
		errors.add(:start_date, "must be before end time") unless start_date < end_date
	end
	def duration
		(end_date - start_date)/60/60/24
	end
	def is_overlaping?
		Reservation.all.where(house_id: self.house.id).each do |other_reservation|
			unless self.end_date <= other_reservation.start_date || self.start_date >= other_reservation.end_date
				errors.add(:is_overlaping?, "Date overlaps")
			end
		end
	end
	belongs_to :guest, class_name: "User"
	belongs_to :house
end