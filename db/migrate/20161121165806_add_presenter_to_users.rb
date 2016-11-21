class AddPresenterToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :presenter, index: true
  end
end
