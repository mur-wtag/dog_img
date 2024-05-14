# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DogsController do
  describe 'GET index' do
    it 'renders index successfully' do
      get :index

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST fetch_breed_image' do
    before do
      allow(DogApi).to receive(:random_image).with(breed).and_return(remote_image_url)
    end

    let(:breed) { 'hound' }
    let(:remote_image_url) { 'https://images.dog.ceo/breeds/hound-blood/n02088466_8144.jpg' }

    it 'renders turbo frame successfully' do
      expect(DogApi).to receive(:random_image).with(breed)
      post :fetch_breed_image, params: { breed:, format: 'turbo_stream' }
      expect(response.media_type).to eq Mime[:turbo_stream]
    end
  end
end
