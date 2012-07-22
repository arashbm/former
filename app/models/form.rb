class Form < ActiveRecord::Base
  attr_accessible :description, :name, :field_ids, :enabled

  has_and_belongs_to_many :fields

  validates :name, presence: true
end