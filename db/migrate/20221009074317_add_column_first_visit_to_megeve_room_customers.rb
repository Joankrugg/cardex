class AddColumnFirstVisitToMegeveRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_room_customers, :first_visit, :datetime
  end
end
