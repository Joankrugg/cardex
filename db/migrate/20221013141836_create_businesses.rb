class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :siret
      t.string :rs
      t.string :brand
      t.string :acronym
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :ape
      t.string :sector
      t.string :people
      t.string :phone
      t.string :surname
      t.string :name
      t.string :position
      t.string :email

      t.timestamps
    end
  end
end
