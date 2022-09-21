class AddColumnActivityToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :activity, :string
  end
end
