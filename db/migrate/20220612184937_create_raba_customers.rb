class CreateRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :raba_customers do |t|
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
