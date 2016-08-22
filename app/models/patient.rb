class Patient < ApplicationRecord
  validate :double_book

  def double_book
    appt_check = Patient.where('start_time':(start_time..end_time))
    appt_check1 = Patient.where('end_time':(start_time..end_time))
    if appt_check.length != 0 || appt_check1.length != 0
      errors.add(:start_time, "Appt already booked in this time slot.")
    end
  end
end
