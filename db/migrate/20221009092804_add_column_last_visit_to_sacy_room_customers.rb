class AddColumnLastVisitToSacyRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_room_customers, :last_visit, :datetime
  end
end
