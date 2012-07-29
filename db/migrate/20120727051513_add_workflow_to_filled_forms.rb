class AddWorkflowToFilledForms < ActiveRecord::Migration
  def change
    add_column :filled_forms, :verified, :boolean
    add_column :filled_forms, :verification_Status, :string
    add_column :filled_forms, :progress, :string
    add_column :filled_forms, :confirmed, :boolean
    add_column :filled_forms, :confirmed_status, :string
  end
end
