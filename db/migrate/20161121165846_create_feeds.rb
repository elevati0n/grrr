class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :user, index: true
      t.references :network, index: true
      t.references :subscription, index: true

      t.timestamps
    end
  end
end
