class AddApprovalToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :approval, index: true
  end
end
