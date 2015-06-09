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

  def create_button(text, url, html_options={})
    mode = html_options[:mode] || 'default'
    html_options.merge! class: "btn btn-#{mode} #{html_options[:class]}"
    link_to icon(html_options[:icon], text), url, html_options
  end

  def show_button(url, text=nil, html_options={})
    create_button text || 'Show', url, html_options.merge!(icon: 'eye')
  end

  def edit_button(url, text=nil, html_options={})
    create_button text || 'Edit', url, html_options.merge!(icon: 'pencil')
  end

  def destroy_button(url, text=nil, html_options={})
    create_button text || 'Destroy', url, html_options.merge!(icon: 'trash')
  end

  def back_button(url=nil, text=nil, html_options={})
    create_button text || 'Back', url || :back, html_options.merge!(icon: 'arrow-left')
  end

  def new_button(url, text=nil, html_options={})
    create_button text || 'New', url, html_options.merge!(icon: 'plus')
  end

  def avatar_for(user)
    cl_image_tag(user.image_id || "f3_mctbah.png", class: 'img-responsive profile-photo',
      width: 300, height: 300)
  end

  def small_avatar_for(user)
    cl_image_tag(user.image_id || "f3_mctbah.png", class: 'img-responsive profile-photo', crop: 'thumb', gravity: 'face',
      width: 100, height: 100)
  end

  def navbar_avatar_for(user)
    cl_image_tag(user.image_id || "f3_mctbah.png", class: 'img-responsive profile-photo', crop: 'thumb', gravity: 'face',
      width: 30, height: 30)
  end
end
