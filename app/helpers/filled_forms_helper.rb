# encoding: UTF-8
module FilledFormsHelper
  def filled_field_input(builder, field, collection=false, as=false)
    opts= {hint: field.description, required: false, label: field.name, as: :string}
    if collection
      opts[:collection]=collection
    end
    opts[:as] = as if as
    builder.input :value, opts
  end

  def fill_new_button(form, filled_forms)
    if form.enabled?
      if filled_forms.all?(&:completed?)
        "#{link_to 'پر کردن نسخه‌ی جدید', new_form_filled_form_path(form), class:'btn'}
        #{link_to 'ویرایش آخرین نسخه ارسال شده', edit_form_filled_form_path(form,filled_forms.last), class:'btn'}".html_safe
      else
        incomplete=filled_forms.all.delete_if(&:completed?)
        link_to 'تکمیل آخرین نسخه‌ی ارسال شده', edit_form_filled_form_path(form,incomplete.last), class:"btn"
      end
    else
      content_tag :div, "این فرم غیر فعال شده است. ممکن است محلت ارسال آن به اتمام رسیده باشد", class:"alert alert-error"
    end
  end
end
