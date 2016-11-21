class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :user, index: true
      t.text :body
      t.references :post, index: true
      t.references :presenter, index: true
      t.references :friendship, index: true

      t.timestamps
    end
  end
end
