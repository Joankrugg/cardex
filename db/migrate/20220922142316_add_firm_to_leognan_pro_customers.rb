class AddFirmToLeognanProCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_pro_customers, :firm, :string
  end
end
