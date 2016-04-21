# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'json'

  # datafile = '/Users/Macbook/Desktop/data_boundaries.csv'
  data_original = Rails.root + 'db/data.csv'
  data_without_boundaries = Rails.root + 'db/data_without_boundaries.csv'
  data_boundaries = Rails.root + 'db/data_only_boundaries.csv'




@dataTable = CSV.table(data_original, :skip_blanks => true)

# @dataTable = CSV.parse(data_original, headers: true, skip_blanks: true).delete_if { |row| row.to_hash.values.all?(&:blank?) }

CSV.open("#{Rails.root}/db/data_only_boundaries.csv", "w") do |f|
  @dataTable[:boundaries][0..75].each do |x|
    f << [x]
  end
  binding.pry
end

CSV.open("#{Rails.root}/db/data_without_boundaries.csv", "w") do |csv|
  @dataTable.delete(:boundaries)
  @dataTable.each do |row|
    csv << row
  end
end

# open("new_data.csv", "w") do |csv|  # create a file
#   csv.puts table                    # write to that
# end

# File.open("resfile.csv","w+") do |f|
#   CSV.foreach(datafile) do |row|
#     f.puts(row[0-13].join(","))
#   end
# end

# boundaries = CSV.read("#{Rails.root}/db/data_only_boundaries.csv")
boundaries = []
CSV.foreach(data_boundaries, :skip_blanks => true, :skip_lines => /^(?:,\s*)+$/) do |row|
  boundaries << row[0]
end

boundaries.map!{|row| eval(row)}

# binding.pry
# p boundaries[0].to_json
# p data_without_boundaries.count

# p eval(boundaries[20][0]).to_json
# p boundaries
# p boundaries.map{|row| eval(row[0])}
# p boundaries.map!{|row| eval(row[0].gsub("=>", ":").gsub("\"", ""))}


CSV.foreach(data_without_boundaries, :skip_blanks => true, :headers => true, :skip_lines => /^(?:,\s*)+$/ ) do |row|
  #   puts $.
  #   p row
  #   p row
  #   (0..13).step do |i|
  #     puts row[i]
  #   end
  #   p eval(row[14]).to_json
  #   p row[14].to_h if row[14] != "{}"
  #   p row[14].gsub(/(^\"|\"?$)/, '').to_a.to_h
  #   p CSV.parse(row[14])
  #
  #   p row[14].gsub("", "").scan(/{(.*)}/)
  #   p JSON.parse(row[14], :quirks_mode => true)
  #
  # p boundaries[$.]


  School.create!({
                   :name => row[0],
                   :school_type => row[1],
                   :mingrade => row[2].to_i,
                   :maxgrade => row[3].to_i,
                   :phone => row[4],
                   :website => row[5],
                   :language => row[6],
                   :created_at => row[7],
                   :updated_at => row[8],
                   :is_catholic => row[9],
                   :level => row[10][(/[A-Z]+/i)],
                   :street => row[11],
                   :postal_code => row[12],
                   :latitude => row[13].to_i,
                   :boundaries => boundaries[$.],
                   :slug => row[0].gsub(/[^\s\w]/, '').gsub(/\s/, '-').downcase
                 })
    puts "Row added!"
end

binding.pry




