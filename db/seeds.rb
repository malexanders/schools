# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

  datafile = Rails.root + 'db/data.csv'

CSV.foreach(datafile) do |row|
    School.create!({
                   :name => row[0],
                   # :type => row[1],
                   :mingrade => row[2].to_i,
                   :maxgrade => row[3].to_i,
                   :phone => row[4],
                   :website => row[5],
                   :language => row[6],
                   :created_at => row[7],
                   :updated_at => row[8],
                   :is_catholic => row[9],
                   :level => row[10],
                   :street => row[11],
                   :postal_code => row[12],
                   :latitude => row[13].to_i
                 })
    puts "Row added!"
end
