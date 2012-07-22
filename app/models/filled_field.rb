class FilledField < ActiveRecord::Base
  belongs_to :filled_form
  belongs_to :field

  # field_id is a security risk or not?!
  attr_accessible :value, :field_id
end
