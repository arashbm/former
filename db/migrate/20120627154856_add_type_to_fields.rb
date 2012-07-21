class AddTypeToFields < ActiveRecord::Migration
  def change
    add_column :fields, :type, :string
  end
end
