class AddVesselToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :vessel, :string
  end
end
