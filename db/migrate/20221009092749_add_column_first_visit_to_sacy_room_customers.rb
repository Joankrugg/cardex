class AddColumnFirstVisitToSacyRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_room_customers, :first_visit, :datetime
  end
end
