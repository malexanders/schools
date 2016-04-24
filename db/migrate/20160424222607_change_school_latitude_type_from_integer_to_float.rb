class ChangeSchoolLatitudeTypeFromIntegerToFloat < ActiveRecord::Migration
  def change
    change_column :schools, :latitude, :float
  end
end
