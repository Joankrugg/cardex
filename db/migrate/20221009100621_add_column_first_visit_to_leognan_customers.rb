class AddColumnFirstVisitToLeognanCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :leognan_customers, :first_visit, :datetime
  end
end
