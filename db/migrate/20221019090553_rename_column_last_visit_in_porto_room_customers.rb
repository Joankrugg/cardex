class RenameColumnLastVisitInPortoRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :porto_room_customers, :last_visit, :porto_last_visit
  end
end
