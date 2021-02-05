class Reservation < ApplicationRecord
	validates :start_date, presence: true
	validates :end_date, presence: true
	validate :end_before_start
	validates :guest, presence: true
	validates :house, presence: true
	def end_before_start
		errors.add(:start_date, "must be before end time") unless start_date < end_date
	end
	def duration
		(end_date - start_date)/60/60/24
	end
	belongs_to :guest, class_name: "User"
	belongs_to :house
end