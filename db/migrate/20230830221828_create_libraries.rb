class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.float :lat
      t.float :lon
      t.integer :book_count

      t.timestamps
    end
  end
end
