class ConsultationsController < ApplicationController
  def new
    authorize @consultation = Consultation.new
    authorize @patient = Patient.find(params[:patient_id])
  end

  def create
    authorize @consultation = Consultation.new(consultation_params)
    authorize @patient = Patient.find(params[:patient_id])
    @consultation.patient = @patient
    if @consultation.save
      redirect_to patient_path(@patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @consultation = Consultation.find(params[:id])
  end

  def update
    authorize @consultation = Consultation.find(params[:id])
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
end
