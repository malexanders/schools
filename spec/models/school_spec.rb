require 'rails_helper'

RSpec.describe School, type: :model do


    valid_row = [ "St. Jean-Marie Vianney Catholic Elementary School",
            "public",
            0,
            8,
            "905-986-4227",
            "http://www.ddsb.ca/school/cartwrightcentral",
            "french immersion",
            "2015-05-20  8:15:00 PM".to_datetime,
            "2015-05-20  8:15:00 PM".to_datetime,
            "false",
            "elementary",
            "10 Alexander St",
            "L0B 1B0",
            44.112257,
            {"secondary"=>[[[43.816306, -79.424443], [43.813966, -79.43548], [43.812044, -79.435236], [43.811882, -79.435687], [43.811549, -79.435558], [43.811634, -79.435033], [43.810651, -79.434646], [43.810504, -79.435097], [43.809737, -79.434829], [43.809799, -79.434357], [43.809412, -79.434174], [43.809272, -79.4347], [43.808715, -79.434453], [43.808839, -79.433917], [43.80808, -79.433649], [43.80791, -79.434142], [43.806965, -79.43367], [43.807074, -79.433177], [43.806524, -79.432983], [43.803489, -79.448358], [43.801862, -79.456104], [43.802002, -79.457756], [43.80314, -79.45737], [43.804658, -79.456244], [43.806787, -79.45619], [43.809358, -79.457306], [43.805335, -79.476635], [43.80597, -79.480498], [43.815486, -79.479103], [43.818226, -79.477015], [43.822685, -79.469805], [43.827639, -79.454055], [43.82904, -79.446895], [43.825998, -79.438949], [43.824883, -79.438477], [43.824636, -79.437447], [43.823645, -79.43543], [43.822623, -79.435687], [43.821849, -79.433584], [43.820022, -79.432297], [43.820301, -79.429121], [43.81931, -79.425173]]]}
            ]

    invalid_row = [ 20,
                  [2,4,5],
                  "string",
                  "string",
                  "905-986-4227",
                  "http://www.ddsb.ca/school/cartwrightcentral",
                  "french immersion",
                  "2015-05-20  8:15:00 PM",
                  "2015-05-20  8:15:00 PM",
                  "false",
                  "elementary",
                  "10 Alexander St",
                  "L0B 1B0",
                  "44.112257",
                  "lkjhdkflg",
                  [{"secondary"=>[[[43.816306, -79.424443], [43.813966, -79.43548], [43.812044, -79.435236], [43.811882, -79.435687], [43.811549, -79.435558], [43.811634, -79.435033], [43.810651, -79.434646], [43.810504, -79.435097], [43.809737, -79.434829], [43.809799, -79.434357], [43.809412, -79.434174], [43.809272, -79.4347], [43.808715, -79.434453], [43.808839, -79.433917], [43.80808, -79.433649], [43.80791, -79.434142], [43.806965, -79.43367], [43.807074, -79.433177], [43.806524, -79.432983], [43.803489, -79.448358], [43.801862, -79.456104], [43.802002, -79.457756], [43.80314, -79.45737], [43.804658, -79.456244], [43.806787, -79.45619], [43.809358, -79.457306], [43.805335, -79.476635], [43.80597, -79.480498], [43.815486, -79.479103], [43.818226, -79.477015], [43.822685, -79.469805], [43.827639, -79.454055], [43.82904, -79.446895], [43.825998, -79.438949], [43.824883, -79.438477], [43.824636, -79.437447], [43.823645, -79.43543], [43.822623, -79.435687], [43.821849, -79.433584], [43.820022, -79.432297], [43.820301, -79.429121], [43.81931, -79.425173]]]}
    ]]


  context "creating a valid school object" do
    it "successfully creates a new school object" do
      school = create(:school,
                        name: valid_row[0],
                        school_type: valid_row[1],
                        mingrade: valid_row[2],
                        maxgrade: valid_row[3],
                        phone: valid_row[4],
                        website: valid_row[5],
                        language: valid_row[6],
                        created_at: valid_row[7],
                        updated_at: valid_row[8],
                        is_catholic: valid_row[9],
                        level: valid_row[10],
                        street: valid_row[11],
                        postal_code: valid_row[12],
                        latitude: valid_row[13],
                        slug: School.slug(valid_row[0]),
                        boundaries: valid_row[14])
    end
  end

  context "attempting to create school object with invalid parameters" do
    it "fails to create a school object" do
      school = create(:school,
                          name: invalid_row[0],
                          school_type: invalid_row[1],
                          mingrade: invalid_row[2],
                          maxgrade: invalid_row[3],
                          phone: invalid_row[4],
                          website: invalid_row[5],
                          language: invalid_row[6],
                          created_at: invalid_row[7],
                          updated_at: invalid_row[8],
                          is_catholic: invalid_row[9],
                          level: invalid_row[10],
                          street: invalid_row[11],
                          postal_code: invalid_row[12],
                          latitude: invalid_row[13],
                          slug: invalid_row[14],
                          boundaries: invalid_row[15])
    end
  end





end


