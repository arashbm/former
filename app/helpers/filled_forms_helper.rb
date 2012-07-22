# encoding: UTF-8
module FilledFormsHelper
  def filled_field_input(builder, field, collection=nil)
    opts= {hint: field.description, required: false, label: field.name}
    if collection != nil
      opts[:collection]=collection
    else
      opts[:as] = :string
    end
    builder.input :value, opts
  end

  def fill_new_button(form)
    if form.enabled?
      link_to 'پر کردن این فرم', new_form_filled_form_path(form), class:"btn btn-success"
    else
      content_tag :div, "این فرم غیر فعال شده است. ممکن است محلت ارسال آن به اتمام رسیده باشد", class:"alert alert-error"
    end
  end
end
