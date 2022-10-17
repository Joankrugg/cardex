class CreateSacyBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :sacy_bubble_customers do |t|
      t.string :genre
      t.string :name
      t.string :surname
      t.string :buy_date
      t.string :title
      t.integer :price
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
