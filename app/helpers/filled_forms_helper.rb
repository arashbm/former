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

  def disabled_notice(form)
    unless form.enabled?
      content_tag :div, "این فرم غیر فعال شده است. ممکن است محلت ارسال آن به اتمام رسیده باشد", class:"alert alert-error"
    end
  end

  def edit_last_button(form, filled_forms)
    return unless form.enabled?
    if filled_forms.any?{ |i| !i.verified? }
      return link_to 'ویرایش آخرین نسخه‌ی تایید نشده', [:edit, form, filled_forms.select{ |i| !i.verified? }.last], class:'btn'
    end
  end

  def fill_new_button(form, filled_forms)
    return unless form.enabled?
    if filled_forms.empty? || filled_forms.all?(&:verified?) || filled_forms.all?(&:completed?)
      link_to 'پر کردن نسخه‌ی جدید', new_form_filled_form_path(form), class:'btn'
    end
  end
end
