class CreateUiElements < ActiveRecord::Migration
  def change
    create_table :ui_elements do |t|
      t.text :meta
      t.references :user, index: true
      t.references :presenter, index: true
      t.references :content, index: true

      t.timestamps
    end
  end
end
