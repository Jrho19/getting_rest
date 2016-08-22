require 'rails_helper'

# Integration test using rspec-rails gem and capybara
RSpec.feature "Patient appt data", type: :feature do
  let!(:patient)do
    Patient.create(
      start_time: "1pm",
      end_time: "2pm",
      first_name: "JR",
      last_name: "Ryder",
      comments: "Retired"
    )
  end

  it "displays all patient's appt data" do
    visit api_v1_patients_path
    expect(page).to have_content
  end
  
  before do
    visit api_v1_patient_path(patient)
  end

  it "displays the patient's first name" do
    expect(page).to have_content patient.first_name
  end

  it "displays the patient's last name" do
    expect(page).to have_content patient.last_name
  end

  it "displays the patient's start time" do
    expect(page).to have_content patient.start_time
  end

  it "displays the patient's end time" do
    expect(page).to have_content patient.end_time
  end

  it "displays the patient's comments" do
    expect(page).to have_content patient.comments
  end
end
