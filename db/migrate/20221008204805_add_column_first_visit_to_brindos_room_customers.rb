class AddColumnFirstVisitToBrindosRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_room_customers, :first_visit, :datetime
  end
end
