class AddUniqueIndexToReservations < ActiveRecord::Migration[7.0]
  def change
    add_index :reservations, [:property_id, :user_id, :reservation_date], unique: true, name: "idx_reserv_on_property_id_and_user_id_and_reserv_date"
  end
end
