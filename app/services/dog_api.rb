# frozen_string_literal: true

require 'httparty'

class DogApi
  include HTTParty

  base_uri ENV.fetch('DOG_API_URL', 'https://dog.ceo/api')
  headers 'Accept' => '*', 'Content-Type' => 'application/json'

  class << self
    def random_image(breed)
      response = get("/breed/#{breed}/images/random")
      parsed_response = JSON.parse(response.body)
      raise DogApiError, parsed_response['message'] if parsed_response['status'] != 'success'

      parsed_response['message']
    end
  end
end
# rubocop:enable Style/Documentation

class DogApiError < StandardError; end
