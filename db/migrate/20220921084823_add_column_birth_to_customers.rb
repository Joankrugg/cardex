class AddColumnBirthToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :birth, :datetime
  end
end
