class RenameColumnLastVisitInRabaRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    rename_column :raba_room_customers, :last_visit, :raba_last_visit
  end
end
