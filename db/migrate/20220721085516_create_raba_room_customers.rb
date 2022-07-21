class CreateRabaRoomCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :raba_room_customers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :genre
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :birth
      t.string :segment
      t.string :home
      t.boolean :unsubscribe

      t.timestamps
    end
  end
end
