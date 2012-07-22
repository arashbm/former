class RemoveCompletedFromFilledForms < ActiveRecord::Migration
  def up
    remove_column :filled_forms, :completed
  end

  def down
    add_column :filled_forms, :completed, :boolean
  end
end
