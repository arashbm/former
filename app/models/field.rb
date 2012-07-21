class Field < ActiveRecord::Base
  attr_accessible :description, :enabled, :name, :field_type
  has_and_belongs_to_many :forms

  validates :name, presence: true
end
