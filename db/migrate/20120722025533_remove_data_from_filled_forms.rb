class RemoveDataFromFilledForms < ActiveRecord::Migration
  def up
    remove_column :filled_forms, :data
      end

  def down
    add_column :filled_forms, :data, :text
  end
end
