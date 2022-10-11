class CreateQuotations < ActiveRecord::Migration[6.0]
  def change
    create_table :quotations do |t|
      t.string :firm
      t.string :zipcode
      t.string :surname
      t.string :name
      t.string :email
      t.string :phone
      t.string :purpose
      t.string :rooming_place
      t.string :fooding_place
      t.integer :people
      t.datetime :demand_date
      t.date :event_date

      t.timestamps
    end
  end
end
