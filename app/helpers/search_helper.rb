module SearchHelper

  def main_search
    content_tag(:div, class: "row bg-light") do
      content_tag(:div, class: "col-6 mt-5 mx-auto position-absolute translate-middle start-50") do
        form_with url: patients_path, method: :get, class: "d-flex" do
          concat text_field_tag(:query, params[:query], class: "form-control", placeholder: "Find a patient")
          concat submit_tag("Search", class: "btn btn-primary")
        end
      end
    end
  end

end
