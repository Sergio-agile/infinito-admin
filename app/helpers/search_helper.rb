module SearchHelper

  def main_search
    content_tag(:div, class: "row bg-light") do
      content_tag(:div, class: "col-6 mt-5 mx-auto position-absolute translate-middle start-50") do
        form_with url: patients_path, method: :get, class: "d-flex", data: { controller: 'search' } do |form|
          concat form.text_field(:query, value: params[:query], class: "form-control", placeholder: "Find a patient", data: { search_target: "query" })
          concat form.submit("Search", class: "btn btn-primary")
        end
      end
    end
  end

end
