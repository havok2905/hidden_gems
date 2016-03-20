class CreatePlaceTag < ActiveRecord::Migration
  def change
    create_table :place_tags do |t|
      t.integer :place_id
      t.integer :tag_id
      t.timestamps null: false
    end
  end
end
