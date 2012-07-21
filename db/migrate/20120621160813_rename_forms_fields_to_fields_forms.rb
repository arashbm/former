class RenameFormsFieldsToFieldsForms < ActiveRecord::Migration
  def change
    rename_table :forms_fields, :fields_forms
  end
end
