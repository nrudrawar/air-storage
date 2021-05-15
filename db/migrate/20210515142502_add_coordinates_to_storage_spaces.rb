class AddCoordinatesToStorageSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :storage_spaces, :latitude, :float
    add_column :storage_spaces, :longitude, :float
  end
end
