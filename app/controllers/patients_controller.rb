class PatientsController < ApplicationController
  def index
    add_breadcrumb "Patients", 'patients'
    if params[:query].present?
      authorize @patients = policy_scope(Patient.where("first_name ILIKE ?", "#{params[:query]}%").page params[:page])
    else
      authorize @patients = policy_scope((Patient.all.order("created_at DESC").page params[:page]))
    end
  end

  def show
    add_breadcrumb "Patients", '/'
    authorize @patient = Patient.find(params[:id])
    add_breadcrumb "Patient details", "#{@patient.id}"
    authorize @consultations = @patient.consultations.
                                        includes([:rich_text_notes_before]).
                                        includes([:rich_text_notes_after]).
                                        includes([:rich_text_notes_to_send]).
                                        all.order("date DESC")
  end

  def new
    add_breadcrumb "Patients", '/'
    add_breadcrumb "New", "patients/new"
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
    add_breadcrumb "Patients", '/'
    add_breadcrumb "Patient details", "/patients/#{@patient.id}"
    add_breadcrumb "Edit patient", "/patients/#{@patient.id}/edit"
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
