class AddColumnLastVisitToPortoRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :porto_room_customers, :last_visit, :datetime
  end
end
