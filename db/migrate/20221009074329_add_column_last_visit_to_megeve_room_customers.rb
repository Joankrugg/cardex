class AddColumnLastVisitToMegeveRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_room_customers, :last_visit, :datetime
  end
end
