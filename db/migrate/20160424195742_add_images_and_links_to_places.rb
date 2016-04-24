class AddImagesAndLinksToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :cover, :string
    add_column :places, :website, :string
  end
end
