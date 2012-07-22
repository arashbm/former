class CreateFilledFields < ActiveRecord::Migration
  def change
    create_table :filled_fields do |t|
      t.references :filled_form
      t.references :field
      t.text :value

      t.timestamps
    end
    add_index :filled_fields, :filled_form_id
    add_index :filled_fields, :field_id
  end
end
