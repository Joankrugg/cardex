class RemoveActivityFromCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :customers, :activity, index:true, foreign_key: true
  end
end

