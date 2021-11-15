class AddVenuesReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :venues, column: :venues_id
    add_index :bookmarks, :venues_id
    change_column_null :bookmarks, :venues_id, false
  end
end
