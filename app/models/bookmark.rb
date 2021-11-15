class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :venues,
             :class_name => "Venue"

  belongs_to :dish,
             :class_name => "FavoritedDish"

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
