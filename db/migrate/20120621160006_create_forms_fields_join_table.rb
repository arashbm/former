class CreateFormsFieldsJoinTable < ActiveRecord::Migration
  def up
    create_table :forms_fields do |t|
      t.integer :form_id
      t.integer :fields_id
    end
  end

  def down
    drop_table :forms_fields
  end
end
