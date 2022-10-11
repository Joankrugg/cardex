class AddCreatorReferenceToQuotations < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotations, :creator, foreign_key: true
  end
end
