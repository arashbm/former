module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "success"
    when :error then "error"
    when :alert then "warning"
    end
  end
  def navbar_item(path,name,additional_class='')
     class_string = if current_page?(path)
       'active'
     else
       ''
     end

     # special case for root_path
     class_string='active' if path==me_students_path && current_page?(root_path)
     class_string<<' '<<additional_class if additional_class != ''
     content_tag :li, class: class_string do
       link_to name,path
     end
  end
end
