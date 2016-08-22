require 'csv'

namespace :import do
  # this rake task imports data from csv
  desc "imports users from csv"
  task patients: :environment do
    CSV.foreach("appt_data.csv", headers: true) do |row|
      Patient.create! row.to_hash
    end
  end
end
