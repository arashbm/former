# encoding: UTF-8
class FilledForm < ActiveRecord::Base
  attr_accessible :student_id, :filled_fields_attributes
  attr_accessible :student_id, :filled_fields_attributes, :verified, :verification_status,
    :progress, :confirmed, :confirmation_status, :as => :admin

  belongs_to :student
  belongs_to :form
  has_many :filled_fields, dependent: :destroy, validate: true, autosave: true
  accepts_nested_attributes_for :filled_fields, update_only: true

  validates :verified, inclusion: { in: ['true','false','nil'] }, presence: true
  validates :confirmed, inclusion: { in: ['true', 'false','nil'] }, presence: true

  validates :student, presence: true, on: :update
  validates_each :form, on: :create do |record, attr, value|
    record.errors.add(:base, :not_enabled) unless value.enabled?
  end
  validates :form, presence: true

  # creating empty filled_fields
  after_initialize(if: :persisted?) do
    form.fields.each do |i|
      filled_fields.find_or_create_by_field_id!(i.id)
    end
  end

  def completed?
    filled_fields.all? {|i| i.field.optional? || i.filled?}
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

  def sorted_filled_fields
    filled_fields.sort_by(&:position)
  end
end
