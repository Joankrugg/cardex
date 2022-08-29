class AddColumnActivityToBrindosRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_room_customers, :activity, :string
  end
end
