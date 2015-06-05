module ApplicationHelper
  def form_errors_for(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> 
    Please review the problems below:
      <a href='#' class='close' data-dismiss='alert'>&times;</a>
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end

  def create_submit(text, html_options={})
    html_options.merge! class: "btn btn-primary #{html_options[:class]}"
    button_tag(html_options) do
      icon('check', text)
    end
  end
end
