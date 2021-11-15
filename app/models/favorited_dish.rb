class FavoritedDish < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "dish_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  # Validations

  # Scopes

  def to_s
    name
  end

end
