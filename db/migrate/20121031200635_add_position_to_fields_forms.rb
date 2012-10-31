class AddPositionToFieldsForms < ActiveRecord::Migration
  def change
    add_column :fields_forms, :position, :integer
  end
end
