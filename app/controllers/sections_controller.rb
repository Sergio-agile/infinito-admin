class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update]

  def index
    authorize @sections = policy_scope(Section.all).order(:order)
  end

  def new
    authorize @section = Section.new
  end

  def create
    authorize @section = Section.new(section_params)
    parent = Section.find(params["section"]["section_id"].to_i) unless params["section"]["section_id"].empty?
    @section.section = parent if parent
    if @section.save
      redirect_to new_section
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def section_params
    params.require(:section).permit(:title, :title_to_display, :order)
  end

  def set_section
    authorize @section = Section.find(params[:id])
  end
end
