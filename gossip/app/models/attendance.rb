class Attendance < ApplicationRecord
  belongs_to :event
  belongs_to :user

  after_create :participation_send

	def participation_send
		UserMailer.participation_email(self).deliver_now
  end
  
end
