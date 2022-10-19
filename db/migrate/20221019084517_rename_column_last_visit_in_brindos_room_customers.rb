class RenameColumnLastVisitInBrindosRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :brindos_room_customers, :last_visit, :brindos_last_visit
  end
end
