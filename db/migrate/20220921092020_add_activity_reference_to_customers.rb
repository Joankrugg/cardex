class AddActivityReferenceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :activity, foreign_key: true
  end
end
