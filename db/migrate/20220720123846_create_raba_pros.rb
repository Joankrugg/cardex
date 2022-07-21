class CreateRabaPros < ActiveRecord::Migration[6.0]
  def change
    create_table :raba_pros do |t|
      t.string :genre
      t.string :firm
      t.string :zipcode
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :unsubscribe

      t.timestamps
    end
  end
end
