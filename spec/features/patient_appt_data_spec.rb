require 'rails_helper'

# Integration test using rspec-rails gem and capybara
RSpec.feature "Patient appt data", type: :request do
  before(:all)do

    @data = {
      patient: {
        start_time: "Mon, 22 Aug 2016 15:43:43 -0400",
        end_time: "Mon, 22 Aug 2016 16:43:43 -0400",
        first_name: "JR",
        last_name: "Ryder",
        comments: "Retired"
      }
    }


  end

  it "displays all patient's appt data" do
    get('/api/v1/patients/')
    expect(response).to have_http_status(200)
  end

  it "creates the patient's appt data" do
    post('/api/v1/patients/', params: @data)
    expect(response).to have_http_status(201)
  end

  it "updates the patient's appt data" do
    a = Patient.create(
      start_time: "Mon, 22 Aug 2016 17:43:43 -0400",
      end_time: "Mon, 22 Aug 2016 18:43:43 -0400",
      first_name: "JR",
      last_name: "Ryder",
      comments: "Updated"
    )
    b = a.id
    put("/api/v1/patients/#{b}", params: @data)
    expect(response).to have_http_status(202)
  end

  it "updates the patient's appt data is booked" do
    a = Patient.create(
      start_time: "Mon, 22 Aug 2016 16:40:43 -0400",
      end_time: "Mon, 22 Aug 2016 17:43:43 -0400",
      first_name: "JR",
      last_name: "Ryder",
      comments: "Updated"
    )
    b = a.id
    put("/api/v1/patients/#{b}", params: @data)
    expect(response).to have_http_status(422)
  end
end
