class CreateBrindosCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :brindos_customers do |t|
      t.string :genre
      t.string :name
      t.string :surname
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :email
      t.string :birth
      t.string :segment

      t.timestamps
    end
  end
end
