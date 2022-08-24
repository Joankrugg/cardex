class AddColumnGenreToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :genre, :string
  end
end
