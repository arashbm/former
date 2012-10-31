class FieldsForm < ActiveRecord::Base
  belongs_to :form
  belongs_to :field
end
