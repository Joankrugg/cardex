class AddSegmentToBrindosBubbleCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :brindos_bubble_customers, :segment, :string
  end
end
