class AddColumnsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :nb_travelers, :integer
  end
end
