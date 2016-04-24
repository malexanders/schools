class School < ActiveRecord::Base

  validates_presence_of(  :name,
                          :school_type,
                          :mingrade,
                          :maxgrade,
                          # :phone, # Some schools have an empty phone field
                          :website,
                          # :language, # Some schools have an empty language field
                          :created_at,
                          :updated_at,
                          :is_catholic,
                          :level,
                          :street,
                          :postal_code,
                          :latitude,
                          :slug)
                          # :boundaries # Some )

  # validates :name, :type => String

  def self.custom_to_json(string)
    JSON.parse string.gsub('=>', ':')
  end

  def self.slug(string)
    string.gsub(/[^\s\w]/, '').gsub(/\s/, '-').downcase
  end

  def self.remove_non_alpha(string)
    string[/[A-Z]+/i]
  end
end
