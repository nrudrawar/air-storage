class CreateStorageSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :storage_spaces do |t|
      t.string :name
      t.string :area
      t.string :address
      t.string :city
      t.string :post_code
      t.string :country
      t.string :description
      t.boolean :available
      t.float :base_price
      t.string :status

      t.timestamps
    end
  end
end
