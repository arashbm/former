class AddEnabledToForms < ActiveRecord::Migration
  def change
    add_column :forms, :enabled, :boolean
  end
end
