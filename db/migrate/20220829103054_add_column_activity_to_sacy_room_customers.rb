class AddColumnActivityToSacyRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_room_customers, :activity, :string
  end
end
