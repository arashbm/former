class RenameVerificationStatusToVerificationStatusOnFilledForms < ActiveRecord::Migration
  def change
    rename_column :filled_forms, :verification_Status, :verification_status
  end
end
