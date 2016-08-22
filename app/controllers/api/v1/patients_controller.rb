class Api::V1::PatientsController < ApplicationController
  respond_to? :json
  skip_before_action :verify_authenticity_token

  def new
  end

  def index
    render json: Patient.all
  end

  def show
    render json: Patient.find(params[:id])
  end

  def create
    patient = Patient.new(patient_params)

    if patient.save
      render json: patient, status: 201
    else
      render json: { errors: patient.errors }, status: 422
    end
  end

  private
    def patient_params
      params.require(:patient).permit(:start_time, :end_time, :first_name, :last_name, :comments)
    end
end
