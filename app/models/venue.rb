class Venue < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "venues_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
