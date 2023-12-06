class AddIsbn10ToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :isbn10, :string
  end
end
