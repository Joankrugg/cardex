class AddSegmentTheouleBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :theoule_bubble_customers, :segment, :string
  end
end
