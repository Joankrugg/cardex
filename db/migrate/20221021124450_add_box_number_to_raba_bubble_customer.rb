class AddBoxNumberToRabaBubbleCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_bubble_customers, :box_number, :string
  end
end
