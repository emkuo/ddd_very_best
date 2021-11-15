class BookmarkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :dish_id, :integer
  attribute :venues_id, :integer

  # Direct associations

  belongs_to :venues,
             resource: VenueResource

  belongs_to :dish,
             resource: FavoritedDishResource

  belongs_to :user

  # Indirect associations

end
