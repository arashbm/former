# Each field type is a bit of string, formatted in a special way and
# validated with some roles defined in FilledField model.
class Field < ActiveRecord::Base
  attr_accessible :description, :enabled, :name, :field_type
  has_and_belongs_to_many :forms

  validates :name, presence: true
end
