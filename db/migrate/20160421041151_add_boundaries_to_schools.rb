class AddBoundariesToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :boundaries, :json
  end
end
