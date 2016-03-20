class CreatePlaceTags < ActiveRecord::Migration
  def change
    create_table :place_tags do |t|
      t.integer :place_id
      t.integer :tag_id
      t.timestamps null: false
    end

    add_index :place_tags, :place_id
    add_index :place_tags, :tag_id
  end
end
