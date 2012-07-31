# encoding: UTF-8
module FilledFormsHelper
  def status_badges(ff)
    b=[]

    if ff.completed?
      b<<badge('کامل','badge-success')
    else
      b<<badge('ناکامل', 'badge-warning','برخی از فیلد‌ها ناقص‌اند')
    end

    if ff.verified?
      b<<badge('تایید شده', 'badge-success', 'این درخواست توسط دفتر استعدادهای درخشان تایید شده و هم‌اکنون در حال طی کردن مراحل اداری‌ست.')
    elsif ff.verified? == false
      b<<badge('تایید نشده', 'badge-warning', "این درخواست توسط دفتر استعدادهای درخشان تایید نشده. دلیل آن «#{ff.verification_status}» ذکر شده. برای اطلاعات بیشتر با دفتر تماس بگیرید.")
    end

    if ff.confirmed?
      b<<badge('موافقت شد', 'badge-success', 'با این درخواست شما موافقت شد.')
    elsif ff.confirmed? == false
      b<<badge('موافقت نشد', 'badge-important', "با این درخواست شما موافقت نشد. دلیل آن «#{ff.confirmation_status}» ذکر شده. برای اطلاعات بیشتر با دفتر استعداد‌های درخشان تماس بگیرید.") if ff.verified?
    end

    b.join(' ').html_safe
  end

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
    not_verified = filled_forms.where(verified: [nil,false])
    if not_verified.count == 1
      return link_to 'ویرایش آخرین نسخه‌ی تایید نشده', [:edit, form, filled_forms.select{ |i| !i.verified? }.last], class:'btn'
    elsif not_verified.count > 1
      return link_to 'مشاهده‌ی فرم‌های در دست تکمیل', form_filled_forms_path(form)
    else
      return ''
    end
  end

  def fill_new_button(form, filled_forms)
    return unless form.enabled?
    if filled_forms.empty? || filled_forms.all?(&:verified?) || filled_forms.all?(&:completed?)
      link_to 'پر کردن نسخه‌ی جدید', new_form_filled_form_path(form), class:'btn'
    end
  end
end
