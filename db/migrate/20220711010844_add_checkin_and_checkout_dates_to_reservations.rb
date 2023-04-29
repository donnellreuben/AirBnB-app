class AddCheckinAndCheckoutDatesToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :checkin_date, :date
    add_column :reservations, :checkout_date, :date
  end
end
