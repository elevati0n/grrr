class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.boolean :approve
      t.references :user, index: true
      t.references :friendship, index: true
      t.references :subscription, index: true
      t.references :membership, index: true

      t.timestamps
    end
  end
end
