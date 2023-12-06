class AddIsbn13ToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :isbn13, :string
  end
end
