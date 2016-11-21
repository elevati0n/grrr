class AddNetworkToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :network, index: true
  end
end
