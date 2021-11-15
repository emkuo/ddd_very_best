class User < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :bookmarks,
             :source => :venues

  # Validations

  # Scopes

  def to_s
    email
  end

end
