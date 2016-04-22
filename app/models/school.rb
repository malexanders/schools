class School < ActiveRecord::Base
  def self.string_keys_to_json(string)
    JSON.parse string.gsub('=>', ':')
  end

  def self.slug(string)
    string.gsub(/[^\s\w]/, '').gsub(/\s/, '-').downcase
  end

  def self.remove_non_alpha(string)
    string[/[A-Z]+/i]
  end
end
