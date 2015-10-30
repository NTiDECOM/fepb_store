module ApplicationHelper
  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

    messages
  end

  def render_in_context(context, object, options={})
	  object_template = object.to_partial_path.split('/').last
	  return unless lookup_context.template_exists?(object_template, [context], true)
	  render "#{product.class.to_s.pluralize.underscore}/form", options.merge({object_template.to_sym => object})
	end
end