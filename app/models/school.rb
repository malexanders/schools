class School < ActiveRecord::Base

  validates :slug, uniqueness: true
  validates :slug, format: { with: /\A[a-z]+(-[a-z]+)*\z/,
                             message: " only allows lowercase letters and hypens,
                                        must begin and end with lowercase letters" }

  validates_type :name, :string
  validates_type :school_type, :string
  validates_type :mingrade, :string, allow_nil: true
  validates_type :maxgrade, :string, allow_nil: true
  validates_type :phone, :string, allow_nil: true
  validates_type :website, :string
  validates_type :language, :string, allow_nil: true
  validates_datetime :created_at
  validates_datetime :updated_at
  validates_type :is_catholic, :string
  validates_type :level, :string
  validates_type :street, :string
  validates_type :postal_code, :string
  validates_type :latitude, :string
  validates_type :slug, :string
  validates_type :boundaries, :hash

  def self.custom_to_json(string)
    JSON.parse string.gsub('=>', ':')
  end

  def self.slug(string)
    # string.gsub(/[^\s\w_]/, '').gsub(/\s/, '-').downcase
    string.gsub(/[^a-zA-Z\d\s:]/, '').gsub(/\s/, '-').downcase

  end

  def self.remove_non_alpha(string)
    string[/[A-Z]+/i]
  end
end
