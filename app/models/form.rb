class Form < ActiveRecord::Base
  attr_accessible :description, :name, :field_ids, :enabled

  has_many :fields_forms 
  has_many :fields, through: :fields_forms
  has_many :filled_forms, order: :position

  validates :name, presence: true
end
