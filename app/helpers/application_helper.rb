module ApplicationHelper
  def authentic_form
    "<input name=\"authenticity_token\" value=\"#{form_authenticity_token}\" type=\"hidden\">".html_safe
  end
end
