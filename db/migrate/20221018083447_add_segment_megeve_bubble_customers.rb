class AddSegmentMegeveBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :megeve_bubble_customers, :segment, :string
  end
end
