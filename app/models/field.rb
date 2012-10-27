# Each field type is a bit of string, formatted in a special way and
# validated with some roles defined in FilledField model.
class Field < ActiveRecord::Base
  attr_accessible :description, :enabled, :name, :field_type
  has_and_belongs_to_many :forms

  validates :name, presence: true
  validates :field_type, presence: true

  def collection
    return FIELDS_CONFIG['fields'].try(:[],field_type).try(:[],'collection')
  end

  def input_type
    return FIELDS_CONFIG['fields'].try(:[],field_type).try(:[],'input_type')
  end

end
