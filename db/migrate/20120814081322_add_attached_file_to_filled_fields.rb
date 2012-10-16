class AddAttachedFileToFilledFields < ActiveRecord::Migration
  def change
    add_column :filled_fields, :attached_file, :string
  end
end
