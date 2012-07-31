class ChangeVerifiedConfimedToString < ActiveRecord::Migration
  def change
    change_column :filled_forms, :verified, :string, null: false, default: 'nil'
    change_column :filled_forms, :confirmed, :string, null: false, default: 'nil'
  end
end
