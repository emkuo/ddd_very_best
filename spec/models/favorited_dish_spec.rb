require 'rails_helper'

RSpec.describe FavoritedDish, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:bookmarks) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
