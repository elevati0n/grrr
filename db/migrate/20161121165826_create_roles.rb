class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :powers
      t.references :user, index: true
      t.text :meta

      t.timestamps
    end
  end
end
