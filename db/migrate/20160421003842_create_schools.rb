class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :type
      t.integer :mingrade
      t.integer :maxgrade
      t.string :phone
      t.string :website
      t.string :language
      t.datetime :created_at
      t.datetime :updated_at
      t.string :is_catholic
      t.string :level
      t.string :street
      t.string :postal_code
      t.integer :latitude

      t.timestamps null: false
    end
  end
end
