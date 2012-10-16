# encoding: UTF-8
module FilledFormsHelper
  def status_badges(ff)
    b=[]

    if ff.completed?
      b<<badge('کامل','badge-success')
    else
      b<<badge('ناکامل', 'badge-warning','برخی از فیلد‌ها ناقص‌اند')
    end

    case ff.verified?
    when true
      b<<badge('تایید شده', 'badge-success', 'این درخواست توسط دفتر استعدادهای درخشان تایید شده و هم‌اکنون در حال طی کردن مراحل اداری‌ست.')
    when false
      b<<badge('تایید نشده', 'badge-warning', "این درخواست توسط دفتر استعدادهای درخشان تایید نشده. دلیل آن «#{ff.verification_status}» ذکر شده. برای اطلاعات بیشتر با دفتر تماس بگیرید.")
    when nil
      b<<badge('در انتظار بررسی', '', "محتوای این فرم هنوز توسط دفتر استعداد‌های درخشان بررسی و تایید نشده.")
    end

    case ff.confirmed?
    when true
      b<<badge('موافقت شد', 'badge-success', 'با این درخواست شما موافقت شد.')
    when false
      b<<badge('موافقت نشد', 'badge-important', "با این درخواست شما موافقت نشد. دلیل آن «#{ff.confirmation_status}» ذکر شده. برای اطلاعات بیشتر با دفتر استعداد‌های درخشان تماس بگیرید.") if ff.verified?
    when nil
      b<<badge('درحال طی مراحل اداری', '', "هنوز نتیجه‌ی این درخواست مشخص نشده. وضعیت این درخواست اینگونه ذکر شده: «#{ff.progress}»") if ff.verified?
    end

    b.join(' ').html_safe
  end

  def filled_field_input(builder, field)
    opts= {hint: field.description, required: false, label: field.name, as: field.input_type.try(:to_sym), collection: field.collection}
    opts[:as]=:string if opts[:collection] == nil && opts[:input_type] == nil
    case field.field_type
    when 'attached-file'
      opts[:as] = :file
      if builder.object.attached_file?
        return "<div class='row'><div class='span4 offset1'><div class='thumbnail'>#{image_tag builder.object.attached_file.url}<p>#{field.name} ارسال شده‌ی فعلی</p></div></div></div>#{builder.input :attached_file, opts}#{builder.hidden_field :attached_file_cache}".html_safe
      else
        concat builder.hidden_field :attached_file_cache
        return builder.input :attached_file, opts
      end
    else
      return builder.input :value, opts
    end
  end

  def disabled_notice(form)
    unless form.enabled?
      content_tag :div, "این فرم غیر فعال شده است. ممکن است محلت ارسال آن به اتمام رسیده باشد", class:"alert alert-error"
    end
  end

  def edit_last_button(form, filled_forms)
    return unless form.enabled?
    not_verified = filled_forms.where(verified: ['nil','false'])
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
    if filled_forms.empty? || filled_forms.all?(&:verified?)
      link_to 'پر کردن نسخه‌ی جدید', new_form_filled_form_path(form), class:'btn'
    end
  end
end
