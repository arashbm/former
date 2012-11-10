class Form < ActiveRecord::Base
  attr_accessible :description, :name, :field_ids, :enabled

  has_many :fields_forms, order: :position
 
  has_many :fields, through: :fields_forms
  has_many :filled_forms
  validates :name, presence: true
end
