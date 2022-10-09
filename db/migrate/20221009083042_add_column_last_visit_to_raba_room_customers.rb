class AddColumnLastVisitToRabaRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_room_customers, :last_visit, :datetime
  end
end
