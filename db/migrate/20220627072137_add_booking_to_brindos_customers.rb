class AddBookingToBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_customers, :booking, :string
  end
end
