class QuestionsController < ApplicationController
  before_action :set_section, only: %i[new create]
  before_action :set_question, only: %i[edit update]

  def new
    authorize @question = Question.new
  end

  def create
    authorize @question = Question.new(question_params)
    @question.section = @section
    if @question.save
      redirect_to section_path(@section)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to sections_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_section
    authorize @section = Section.find(params[:section_id])
  end

  def set_question
    authorize @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :title_to_display, :order)
  end
end
