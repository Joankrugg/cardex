class AddColumnActivityToRabaRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_room_customers, :activity, :string
  end
end
