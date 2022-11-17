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
      redirect_to sections_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # parent = Section.find(params["section"]["section_id"].to_i) unless params["section"]["section_id"].empty?
    parent = params["section"]["section_id"]
    # parent = nil if parent.empty?
    parent.empty? ? parent = nil : parent = Section.find(params["section"]["section_id"].to_i)
    @section.section = parent
    if @section.update(section_params)
      redirect_to section_path(@section)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def section_params
    params.require(:section).permit(:title, :title_to_display, :order)
  end

  def set_section
    authorize @section = Section.find(params[:id])
  end
end
