class ChangeColumnBooking < ActiveRecord::Migration[6.0]
  def change
    rename_column :brindos_customers, :booking, :booking_method
  end
end
