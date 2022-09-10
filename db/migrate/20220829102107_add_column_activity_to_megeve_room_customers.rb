class AddColumnActivityToMegeveRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_room_customers, :activity, :string
  end
end
