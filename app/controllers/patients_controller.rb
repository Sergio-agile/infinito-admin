class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update]
  before_action :set_breadcrumbs, only: %i[index show new edit]

  def index
    if params[:query].present?
      authorize @patients = policy_scope(Patient.where("first_name ILIKE ?", "#{params[:query]}%").page params[:page])
    else
      authorize @patients = policy_scope((Patient.all.order("created_at DESC").page params[:page]))
    end
  end

  def show
    authorize @consultations = @patient.consultations.
                                        includes([:rich_text_notes_before]).
                                        includes([:rich_text_notes_after]).
                                        includes([:rich_text_notes_to_send]).
                                        all.order("date DESC")
  end

  def new
    authorize @patient = Patient.new
  end

  def create
    authorize @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patient_path(@patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birthdate, :phone, :address, :email, :dni)
  end

  def set_patient
    authorize @patient = Patient.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb "Home", '/'
    add_breadcrumb "Patients", patients_path
    add_breadcrumb "New", new_patient_path if action_name == 'new'
    add_breadcrumb "Patient details", "/patients/#{@patient.id}" if action_name == 'show' || action_name == 'edit'
    add_breadcrumb "Edit details", "/patients/#{@patient.id}/edit" if action_name == 'edit'
  end
end
