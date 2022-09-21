class AddHomeReferenceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :home, foreign_key: true
  end
end
