# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DogApi do
  describe '.random_image' do
    subject { described_class.random_image(breed) }

    context 'with valid breed' do
      let(:breed) { 'hound' }

      it 'returns a random image' do
        VCR.use_cassette('valid_breed') do
          expect(subject).to eq 'https://images.dog.ceo/breeds/hound-afghan/n02088094_1534.jpg'
        end
      end
    end

    context 'with invalid breed' do
      let(:breed) { 'invalid_breed' }

      it 'returns error message' do
        VCR.use_cassette('invalid_breed') do
          expect { subject }.to raise_error(DogApiError).with_message('Breed not found (master breed does not exist)')
        end
      end
    end
  end
end
