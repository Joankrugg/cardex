class CreateMailOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_orders do |t|
      t.references :user
      t.string :title
      t.datetime :send_date
      t.text :text
      t.string :goal

      t.timestamps
    end
  end
end
