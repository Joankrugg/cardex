class AddSegmentSacyBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :sacy_bubble_customers, :segment, :string
  end
end
