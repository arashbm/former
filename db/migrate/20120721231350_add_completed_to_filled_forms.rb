class AddCompletedToFilledForms < ActiveRecord::Migration
  def change
    add_column :filled_forms, :completed, :boolean, default: false, null: false
  end
end
