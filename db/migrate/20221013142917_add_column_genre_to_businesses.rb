class AddColumnGenreToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :genre, :string
  end
end
