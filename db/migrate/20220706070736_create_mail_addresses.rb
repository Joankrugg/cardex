class CreateMailAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_addresses do |t|
      t.string :email
      t.string :status
      t.string :blocked
      t.string :hard_bounce
      t.string :soft_bounce
      t.string :retrying
      t.string :open
      t.string :click
      t.string :unsub
      t.string :spam
      t.string :reason
      t.string :date
      t.string :messageid

      t.timestamps
    end
  end
end
