class RenameConfirmedStatusToConfirmationStatus < ActiveRecord::Migration
  def change
    rename_column :filled_forms, :confirmed_status, :confirmation_status
  end
end
