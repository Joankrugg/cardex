class AddColumnNightToMegeveRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_room_customers, :night, :integer
  end
end
