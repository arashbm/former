# encoding: UTF-8
class FilledForm < ActiveRecord::Base
  attr_accessible :data, :form_id, :student_id

  serialize :data

  belongs_to :student
  belongs_to :form

  validates :form, presence: true
  validates_each :form do |record, attr, value|
    record.errors.add(:base, :not_enabled) if value.enabled? != true
  end
  validates_each :data do |record, attr, value|
    value.each do |field_data|
      f=Field.find_by_name(field_data[0])
      case f.field_type
      when 'daneshkade-reshte-gerayes'
      when 'maghta'
        acceptable=[I18n.t(:undergrad),I18n.t(:grad),I18n.t(:phd)]
        if !acceptable.include?(field_data[1])
          record.errors.add("data[#{field_data[0]}]".to_sym, field_data[0]+' '+I18n.t('errors.messages.inclusion'))
        end
      when 'tedadevahed'
        record.errors.add(:data, :not_a_number) if !(field_data[1].to_s =~ /\A[+-]?\d+\Z/)
        record.errors.add(:data, :greater_than_or_equal_to,0) if field_data[1].to_i < 0
      else
      end
    end
  end
end
