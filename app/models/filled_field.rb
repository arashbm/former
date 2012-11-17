class FilledField < ActiveRecord::Base
  belongs_to :filled_form
  belongs_to :field

  mount_uploader :attached_file, AttachedFileUploader

  # field_id is a security risk or not?!
  attr_accessible :value, :field_id, :attached_file, :attached_file_cache
  attr_accessible :value, :field_id, :attached_file, :attached_file_cache, as: :admin

  validates :value, numericality: { only_integer: true },
    if: Proc.new { |ff| ff.field.field_type == 'generic-numerical'}

  validates :value, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to:20},
                                    allow_nil: true, if: Proc.new { |ff| ff.field.field_type == 'grade' }
  # validates :value, inclusion: { in: [] }
  def position
    filled_form.form.fields_forms.find_by_field_id(field_id).position
  end
  def filled?
    case field.input_type
    when 'file'
      return attached_file?
    else
      return !value.blank?
    end
  end
end
