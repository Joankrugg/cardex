class AddSegmentLeognanBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_bubble_customers, :segment, :string
  end
end
