require "rails_helper"

RSpec.describe "favorited_dishes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/favorited_dishes/#{favorited_dish.id}"
  end

  describe "basic destroy" do
    let!(:favorited_dish) { create(:favorited_dish) }

    it "updates the resource" do
      expect(FavoritedDishResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { FavoritedDish.count }.by(-1)
      expect { favorited_dish.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
