class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.text :description
      t.boolean :enabled

      t.timestamps
    end
  end
end
