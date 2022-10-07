class CreateSalesReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_reviews do |t|
      t.string :genre
      t.string :name
      t.string :surname
      t.string :email
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :position
      t.string :phone
      t.string :firm
      t.string :language
      t.string :note
      t.string :state
      t.string :activity

      t.timestamps
    end
  end
end
