class AddColumnGenreToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :genre, :string
  end
end
