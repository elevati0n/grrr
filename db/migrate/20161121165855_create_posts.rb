class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.boolean :private
      t.references :feed, index: true
      t.references :network, index: true

      t.timestamps
    end
  end
end
