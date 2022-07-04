class AddColumnSegmentToRabaCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :raba_customers, :segment, :string
  end
end
