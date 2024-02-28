# app/helpers/application_helper.rb
module ApplicationHelper
  def options_from_api_for_select_component(api_data)
    options_for_select(api_data.map { |component| [component['componentName'], component['componentName']] })
  end
end
