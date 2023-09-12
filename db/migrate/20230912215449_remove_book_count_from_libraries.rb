class RemoveBookCountFromLibraries < ActiveRecord::Migration[7.0]
  def change
    remove_column :libraries, :book_count, :integer
  end
end
