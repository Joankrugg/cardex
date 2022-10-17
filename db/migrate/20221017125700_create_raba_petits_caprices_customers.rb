class CreateRabaPetitsCapricesCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :raba_petits_caprices_customers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.string :genre
      t.string :zipcode
      t.string :city
      t.string :country
      t.datetime :birth
      t.string :segment
      t.boolean :unsubscribe
      t.string :activity
      t.datetime :raba_petits_caprices_last_visit
      t.integer :raba_petits_caprices_visit_number
      t.string :newsletter

      t.timestamps
    end
  end
end
