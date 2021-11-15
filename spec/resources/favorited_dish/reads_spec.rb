require "rails_helper"

RSpec.describe FavoritedDishResource, type: :resource do
  describe "serialization" do
    let!(:favorited_dish) { create(:favorited_dish) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(favorited_dish.id)
      expect(data.jsonapi_type).to eq("favorited_dishes")
    end
  end

  describe "filtering" do
    let!(:favorited_dish1) { create(:favorited_dish) }
    let!(:favorited_dish2) { create(:favorited_dish) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: favorited_dish2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([favorited_dish2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:favorited_dish1) { create(:favorited_dish) }
      let!(:favorited_dish2) { create(:favorited_dish) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorited_dish1.id,
                                      favorited_dish2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorited_dish2.id,
                                      favorited_dish1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
