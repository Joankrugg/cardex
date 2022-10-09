class AddColumnLastVisitToLeognanCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_customers, :last_visit, :datetime
  end
end
