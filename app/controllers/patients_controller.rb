class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render new_patient_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birthdate, :phone, :address, :email, :dni)
  end
end
