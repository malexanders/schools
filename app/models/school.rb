class School < ActiveRecord::Base

  # validates_presence_of(  :name,
  #                         :school_type,
  #                         :mingrade,
  #                         :maxgrade,
  #                         :phone,
  #                         :website,
  #                         :language,
  #                         :created_at,
  #                         :updated_at,
  #                         :is_catholic,
  #                         :level,
  #                         :street,
  #                         :postal_code,
  #                         :latitude,
  #                         :slug,
  #                         :boundaries  )

  validates_type :name, :string
  validates_type :school_type, :string
  validates_type :mingrade, :integer, allow_nil: true, allow_blank: true
  validates_type :maxgrade, :integer, allow_nil: true, allow_blank: true
  validates_type :phone, :string, allow_nil: true
  validates_type :website, :string
  validates_type :language, :string, allow_nil: true
  # validates_type :created_at, :date # Throwing an error for some reason.
  # validates_type :updated_at, :date # Throwing an error for some reason.
  validates_type :is_catholic, :string
  validates_type :level, :string
  validates_type :street, :string
  validates_type :postal_code, :string
  validates_type :latitude, :float
  validates_type :slug, :string
  validates_type :boundaries, :hash

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
