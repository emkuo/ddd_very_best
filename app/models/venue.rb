class Venue < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood

  has_many   :bookmarks,
             foreign_key: "venues_id",
             dependent: :destroy

  # Indirect associations

  has_many   :users,
             through: :bookmarks,
             source: :user

  # Validations

  # Scopes

  def to_s
    name
  end
end
