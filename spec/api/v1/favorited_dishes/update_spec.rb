require "rails_helper"

RSpec.describe "favorited_dishes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/favorited_dishes/#{favorited_dish.id}", payload
  end

  describe "basic update" do
    let!(:favorited_dish) { create(:favorited_dish) }

    let(:payload) do
      {
        data: {
          id: favorited_dish.id.to_s,
          type: "favorited_dishes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FavoritedDishResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { favorited_dish.reload.attributes }
    end
  end
end
