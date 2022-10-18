class AddSegmentRabaBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_bubble_customers, :segment, :string
  end
end
