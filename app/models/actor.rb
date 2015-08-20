class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    # we have two columns, first_name and last_name
    # how to inject data into a string - interpolate
    "#{self.first_name} #{self.last_name}"
  end
  
  def list_roles
    # "Khaleesi - Game of Thrones"
    characters.map do |character|
      "#{character.name} - #{character.show.name}"
    end.join(" ")
  end
end