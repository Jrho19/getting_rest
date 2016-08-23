class Patient < ApplicationRecord
  validate :double_book, :future_appt

  def double_book
    appt_check = Patient.where('start_time':(start_time..end_time))
    appt_check1 = Patient.where('end_time':(start_time..end_time))
    if appt_check.length != 0 || appt_check1.length != 0
      errors.add(:start_time, "Appt already booked in this time slot.")
    end
  end

  def future_appt
    if start_time < Time.now
      errors.add(:start_time, "Can not be in the past.")
    end
  end
end
