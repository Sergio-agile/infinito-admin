class PatientsController < ApplicationController
  def index
    if params[:query].present?
      authorize @patients = policy_scope(Patient.where("first_name ILIKE ?", "#{params[:query]}%"))
    else
      authorize @patients = policy_scope(Patient.all)
    end
  end

  def show
    authorize @patient = Patient.find(params[:id])
    authorize @consultations = @patient.consultations.all.order("date DESC")
  end

  def new
    authorize @patient = Patient.new
  end

  def create
    authorize @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render new_patient_path
    end
  end

  def edit
    authorize @patient = Patient.find(params[:id])
  end

  def update
    authorize patient = Patient.find(params[:id])
    if patient.update(patient_params)
      redirect_to patient_path(patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birthdate, :phone, :address, :email, :dni)
  end
end
