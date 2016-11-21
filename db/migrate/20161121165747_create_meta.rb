class CreateMeta < ActiveRecord::Migration
  def change
    create_table :meta do |t|
      t.references :content, index: true
      t.text :data
      t.references :user, index: true
      t.references :approval, index: true
      t.references :post, index: true
      t.references :feed, index: true
      t.references :presenter, index: true
      t.references :friendship, index: true

      t.timestamps
    end
  end
end
