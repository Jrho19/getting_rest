require 'csv'

namespace :import do
  # this rake task imports data from csv
  desc "imports users from csv"
  task patients: :environment do
    CSV.foreach("appt_data.csv", headers: true) do |row|
      pat_appt = row.to_hash
      pat_appt['start_time'] = Time.strptime(pat_appt['start_time'], "%D %R")
      pat_appt['end_time'] = Time.strptime(pat_appt['end_time'], "%D %R")
      Patient.create pat_appt
    end
  end
end
