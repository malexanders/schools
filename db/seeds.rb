require 'csv'

data = Rails.root + 'db/data.csv'
data_to_array = CSV.read(data, skip_blanks: true, headers: true)

data_to_array.each do |row|
  School.create!(name: row[0],
                 school_type: row[1],
                 mingrade: row[2].to_i,
                 maxgrade: row[3].to_i,
                 phone: row[4],
                 website: row[5],
                 language: row[6],
                 created_at: row[7],
                 updated_at: row[8],
                 is_catholic: row[9],
                 level: School.remove_non_alpha(row[10]),
                 street: row[11],
                 postal_code: row[12],
                 latitude: row[13].to_i,
                 boundaries: School.string_keys_to_json(row[14]),
                 slug: School.slug(row[0]))
end

# data_without_boundaries = Rails.root + 'db/data_without_boundaries.csv'
# data_only_boundaries = Rails.root + 'db/data_only_boundaries.csv'
#
# @dataTable = CSV.table(data_original, :skip_blanks => true, :skip_lines => /^(?:,\s*)+$/)
#
# CSV.open("#{Rails.root}/db/data_only_boundaries.csv", "w") do |f|
#   @dataTable[:boundaries][0..72].each do |x|
#     f << [x]
#   end
#   binding.pry
# end
#
# CSV.open("#{Rails.root}/db/data_without_boundaries.csv", "w") do |csv|
#   @dataTable.delete(:boundaries)
#   @dataTable.to_a[1..73].each do |row|
#     csv << row
#   end
# end
#
# boundaries = []
#
# CSV.foreach(data_only_boundaries) do |row|
#   boundaries << eval(row[0])
# end
#
# CSV.foreach(data_without_boundaries, :skip_blanks => true, :headers => false, :skip_lines => /^(?:,\s*)+$/ ) do |row|
#   p $.
#   School.create!({
#                    :name => row[0],
#                    :school_type => row[1],
#                    :mingrade => row[2].to_i,
#                    :maxgrade => row[3].to_i,
#                    :phone => row[4],
#                    :website => row[5],
#                    :language => row[6],
#                    :created_at => row[7],
#                    :updated_at => row[8],
#                    :is_catholic => row[9],
#                    :level => row[10][(/[A-Z]+/i)],
#                    :street => row[11],
#                    :postal_code => row[12],
#                    :latitude => row[13].to_i,
#                    :boundaries => boundaries[($. - 1)],
#                    :slug => row[0].gsub(/[^\s\w]/, '').gsub(/\s/, '-').downcase
#                  })
#     puts "Row added!"
# end
