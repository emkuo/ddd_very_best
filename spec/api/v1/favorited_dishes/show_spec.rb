require "rails_helper"

RSpec.describe "favorited_dishes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorited_dishes/#{favorited_dish.id}", params: params
  end

  describe "basic fetch" do
    let!(:favorited_dish) { create(:favorited_dish) }

    it "works" do
      expect(FavoritedDishResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("favorited_dishes")
      expect(d.id).to eq(favorited_dish.id)
    end
  end
end
