class AddUserReferencesToStorageSpaces < ActiveRecord::Migration[6.1]
  def change
    add_reference :storage_spaces, :user, null: false, foreign_key: true
  end
end
