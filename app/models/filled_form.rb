# encoding: UTF-8
class FilledForm < ActiveRecord::Base
  attr_accessible :student_id, :filled_fields_attributes
  attr_accessible :student_id, :filled_fields_attributes, :verified, :verification_status,
    :progress, :confirmed, :confirmation_status, :as => :admin

  belongs_to :student
  belongs_to :form
  has_many :filled_fields, dependent: :destroy, validate: true, autosave: true
  accepts_nested_attributes_for :filled_fields

  validates :verified, inclusion: { in: ['true','false','nil'] }, presence: true
  validates :confirmed, inclusion: { in: ['true', 'false','nil'] }, presence: true

  validates :student, presence: true, on: :update
  validates_each :form, on: :create do |record, attr, value|
    record.errors.add(:base, :not_enabled) unless value.enabled?
  end
  validates :form, presence: true
 
  # creating empty filled_fields
  after_save do
    form.fields.each do |i|
      filled_fields.find_or_create_by_field_id!(i.id)
    end
  end

  def completed?
    filled_fields.all? {|i| !i.value.blank?}
  end


  def confirmed?
    case confirmed
    when 'true'
      true
    when 'false'
      false
    when 'nil'
      nil
    end
  end

  def verified?
    case verified
    when 'true'
      true
    when 'false'
      false
    when 'nil'
      nil
    end
  end

  # FIXME: CLEAN THIS MESS UP!
  # validates_each :data do |record, attr, value|
    # value.each do |field_data|
      # f=Field.find_by_name(field_data[0])
      # case f.field_type
      # when 'daneshkade-reshte-gerayes'
      # when 'maghta'
      #   acceptable=[I18n.t(:undergrad),I18n.t(:grad),I18n.t(:phd)]
      #   if !acceptable.include?(field_data[1])
      #     record.errors.add("data[#{field_data[0]}]".to_sym, field_data[0]+' '+I18n.t('errors.messages.inclusion'))
      #   end
      # when 'tedadevahed'
        # record.errors.add(:data, :not_a_number) if !(field_data[1].to_s =~ /\A[+-]?\d+\Z/)
        # record.errors.add(:data, :greater_than_or_equal_to,0) if field_data[1].to_i < 0
      # else
      # end
    # # end
  # end
end
