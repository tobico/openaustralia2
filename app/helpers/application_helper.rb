# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_on_if_current(name, options, html_options)
    link_to_unless_current(name, options, html_options) do |name|
      link_to(name, options, html_options.merge(:class => "on"))
    end
  end
  
  # TODO: There's most probably a standard method for doing this
  def escape_path(text)
    text.gsub('/','%2F').gsub('?', '%3F').gsub('=', '%3D')
  end
end

