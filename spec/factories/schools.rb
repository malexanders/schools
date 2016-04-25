FactoryGirl.define do

  factory :school do
    name nil
    school_type nil
    mingrade nil
    maxgrade nil
    phone nil
    website nil
    language nil
    created_at nil
    updated_at nil
    is_catholic nil
    level nil
    street nil
    postal_code nil
    latitude nil
    slug nil
    boundaries nil
  end

  # after(:create) { |object| p object }

end
