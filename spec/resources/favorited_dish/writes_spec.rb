require 'rails_helper'

RSpec.describe FavoritedDishResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'favorited_dishes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FavoritedDishResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FavoritedDish.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:favorited_dish) { create(:favorited_dish) }

    let(:payload) do
      {
        data: {
          id: favorited_dish.id.to_s,
          type: 'favorited_dishes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FavoritedDishResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { favorited_dish.reload.updated_at }
      # .and change { favorited_dish.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:favorited_dish) { create(:favorited_dish) }

    let(:instance) do
      FavoritedDishResource.find(id: favorited_dish.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FavoritedDish.count }.by(-1)
    end
  end
end
