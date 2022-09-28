class ConsultationsController < ApplicationController
  def new
    @consultation = Consultation.new
    @patient = Patient.find(params[:patient_id])
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @patient = Patient.find(params[:patient_id])
    @consultation.patient = @patient
    if @consultation.save
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @consultation = Consultation.find(params[:id])
  end

  def update
    @consultation = Consultation.find(params[:id])
    if @consultation.update(consultation_params)
      redirect_to patient_path(@consultation.patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:notes_after, :notes_before)
  end
end
