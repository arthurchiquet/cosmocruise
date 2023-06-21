class AddColumnsToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :departure, :string
    add_column :trips, :nb_travelers_max, :integer
    add_column :trips, :nb_days_min, :integer
  end
end
