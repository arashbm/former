module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "success"
    when :error then "error"
    when :alert then "warning"
    end
  end

  def navbar_item(path,name,additional_class='',method=nil, icon=nil)
     class_string = if current_page?(path)
       'active'
     else
       ''
     end

     name = "<i class='icon-#{icon}'></i> #{h(name)}".html_safe if icon

     # special case for root_path
     class_string='active' if path==blogs_path && current_page?(root_path)
     class_string << ' ' << additional_class unless additional_class == ''
     content_tag :li, class: class_string do
       p method
       link_to name,path, method: method
     end
  end

  def badge(text,additional_classes="", title='')
    content_tag :span, text, class: "badge #{additional_classes}", title:title 
  end
end
