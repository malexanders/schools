FactoryGirl.define do

  factory :school do
    name
    school_type
    mingrade
    maxgrade
    phone
    website
    language
    created_at
    updated_at
    is_catholic
    level
    street
    postal_code
    latitude
    slug
    boundaries
  end

end
