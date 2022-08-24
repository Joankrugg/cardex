class AddTypeReferenceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :type, foreign_key: true
  end
end
