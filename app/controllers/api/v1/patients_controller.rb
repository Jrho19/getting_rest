class Api::V1::PatientsController < ApplicationController
  respond_to? :json
  skip_before_action :verify_authenticity_token

  def new
  end

  def index
    render json: Patient.all
  end

  def show
    render json: find_params
  end

  def create
    patient = Patient.new(patient_params)

    if patient.save
      render json: patient, status: 201
    else
      render json: { errors: patient.errors }, status: 422
    end
  end

  def update
    patient = find_params

    if patient.update(patient_params)
      render json: patient, status: 202
    else
      render json: { errors: patient.errors }, status: 422
    end
  end

  def destroy
    patient = find_params
    patient.destroy
    head 204
  end

  private
    def patient_params
      params.require(:patient).permit(:start_time, :end_time, :first_name, :last_name, :comments)
    end

    def find_params
      Patient.find(params[:id])
    end
end
