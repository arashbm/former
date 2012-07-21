class ChangeFiledsIsToFieldIdInFieldsForms < ActiveRecord::Migration
  def change
    rename_column :fields_forms, :fields_id, :field_id
  end
end
