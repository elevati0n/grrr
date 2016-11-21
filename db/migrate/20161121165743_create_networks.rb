class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.references :user, index: true
      t.boolean :private

      t.timestamps
    end
  end
end
