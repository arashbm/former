class AddOptionalToFields < ActiveRecord::Migration
  def change
    add_column :fields, :optional, :boolean
  end
end
