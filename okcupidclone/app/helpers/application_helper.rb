module ApplicationHelper
  def authentic_form
    <<-HTML.html_safe
      <input name="authenticity_token" value="<%= form_authenticity_token %>" type="hidden">
    HTML
  end
end
