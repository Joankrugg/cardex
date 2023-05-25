class CreateTheouleProCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :theoule_pro_customers do |t|
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
      t.string :address
      t.string :position
      t.string :firm
      t.string :note
      t.string :state

      t.timestamps
    end
  end
end
