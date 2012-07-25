class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :major, :string
    add_column :students, :minor, :string
    add_column :students, :father_name, :string
    add_column :students, :gender, :string
    add_column :students, :phone_number, :string
    add_column :students, :mobile_phone, :string
    add_column :students, :identification_number, :string
    add_column :students, :birth_date, :string
    add_column :students, :bylaw, :string
  end
end
