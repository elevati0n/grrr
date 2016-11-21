class AddFriendshipToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :friendship, index: true
  end
end
