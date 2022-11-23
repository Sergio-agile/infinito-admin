class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update]
  before_action :set_breadcrumbs, only: %i[index show new edit]

  def index
    # authorize @sections = policy_scope(Section).includes(:sections, :questions).all.order(:order, :created_at, :section_id)
    # authorize @sections = policy_scope(Section).joins(:sections).includes(:sections, :questions).all.order(:order)
    # authorize @sections = policy_scope(Section).left_joins(:sections).distinct.all.order(section_id: :desc).order(:order)
    authorize @sections = policy_scope(Section).includes(:sections, :questions).all.order(:order)

    # .left_joins(:sections).where(sections: { section_id: !nil })
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
    parent = params["section"]["section_id"]
    parent.empty? ? parent = nil : parent = Section.find(params["section"]["section_id"].to_i)
    @section.section = parent
    if @section.update(section_params)
      redirect_to sections_path
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

  def set_breadcrumbs
    add_breadcrumb "Home", '/'
    add_breadcrumb "Sections", sections_path
    add_breadcrumb "New", new_section_path if action_name == 'new'
    # add_breadcrumb "Patient details", "/patients/#{@patient.id}" if action_name == 'show' || action_name == 'edit'
    add_breadcrumb "Edit details", "/sections/#{@section.id}/edit" if action_name == 'edit'
  end
end
