class ConsultationsController < ApplicationController
  before_action :set_patient, only: %i[new create]
  before_action :set_consultation, only: %i[edit update]

  def new
    authorize @consultation = Consultation.new
    add_breadcrumb "Patients", '/'
    add_breadcrumb "Patient details", "/patients/#{@patient.id}"
    add_breadcrumb "New consultation", "/patients/#{@patient.id}/consultations/new"
  end

  def create
    authorize @consultation = Consultation.new(consultation_params)
    @consultation.patient = @patient
    if @consultation.save
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    add_breadcrumb "Patients", '/'
    add_breadcrumb "Patient details", "/patients/#{@consultation.patient.id}"
    add_breadcrumb "Edit consultation", "/patients/#{@consultation.patient.id}/consultations/#{@consultation.id}/edit"
  end

  def update
    if @consultation.update(consultation_params)
      redirect_to patient_path(@consultation.patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:notes_after, :notes_before, :notes_to_send)
  end

  def set_patient
    authorize @patient = Patient.find(params[:patient_id])
  end

  def set_consultation
    authorize @consultation = Consultation.find(params[:id])
  end
end
