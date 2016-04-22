require 'csv'

data = Rails.root + 'db/data.csv'                                 # Saves file path to variable 'data'
data_to_array = CSV.read(data, skip_blanks: true, headers: true)  # Returns an array of arrays

data_to_array.each do |row|                                       # Iterates over all rows
  School.create!(name: row[0],                                    # Creates an instance of school for each row
                 school_type: row[1],
                 mingrade: row[2].to_i,
                 maxgrade: row[3].to_i,
                 phone: row[4],
                 website: row[5],
                 language: row[6],
                 created_at: row[7],
                 updated_at: row[8],
                 is_catholic: row[9],
                 level: School.remove_non_alpha(row[10]),         # Strips non alpha characters
                 street: row[11],
                 postal_code: row[12],
                 latitude: row[13].to_i,
                 boundaries: School.custom_to_json(row[14]),      # Converts string object to json like hash object
                 slug: School.slug(row[0]))                       # Creates slug
end
