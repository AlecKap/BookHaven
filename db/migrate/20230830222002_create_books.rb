class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :description
      t.string :genre
      t.string :book_img

      t.timestamps
    end
  end
end
