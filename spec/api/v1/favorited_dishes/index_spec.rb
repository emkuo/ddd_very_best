require 'rails_helper'

RSpec.describe "favorited_dishes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorited_dishes", params: params
  end

  describe 'basic fetch' do
    let!(:favorited_dish1) { create(:favorited_dish) }
    let!(:favorited_dish2) { create(:favorited_dish) }

    it 'works' do
      expect(FavoritedDishResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['favorited_dishes'])
      expect(d.map(&:id)).to match_array([favorited_dish1.id, favorited_dish2.id])
    end
  end
end
