class CreatePlace < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :lat
      t.float :lon
      t.string :description
      t.string :name
      t.timestamps null: false
    end
  end
end
