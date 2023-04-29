class AddUserReferenceToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :user, null: true, foreign_key: true
    Property.update_all(user_id: User.first.id)
  end
end
