class RemoveBylawFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :bylaw
      end

  def down
    add_column :students, :bylaw, :string
  end
end
