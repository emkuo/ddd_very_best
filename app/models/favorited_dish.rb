class FavoritedDish < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "dish_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
