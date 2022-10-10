class AddColumnLastVisitToCustomLists < ActiveRecord::Migration[6.0]
  def change
    add_column :custom_lists, :last_visit, :datetime
  end
end
