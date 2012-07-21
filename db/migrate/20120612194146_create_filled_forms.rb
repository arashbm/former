class CreateFilledForms < ActiveRecord::Migration
  def change
    create_table :filled_forms do |t|
      t.integer :student_id
      t.integer :form_id
      t.text :data

      t.timestamps
    end
  end
end
