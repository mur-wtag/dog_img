# frozen_string_literal: true

class DogsController < ApplicationController
  def index; end

  def fetch_breed_image
    error_message = nil
    image_url = begin
      DogApi.random_image(dogs_params[:breed])
    rescue DogApiError => e
      error_message = e
    end

    respond_to do |format|
      format.html {} # rubocop:disable Lint/EmptyBlock
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace(
            'image_container',
            partial: 'dogs/image',
            locals: {
              dog_breed: dogs_params[:breed],
              dog_image_url: image_url,
              error: error_message
            }
          ),
          turbo_stream.after(
            'image_container',
            helpers.javascript_tag(
              %(document.querySelector('.dog-image-loader').classList.remove('loading'))
            )
          )
        ]
      end
    end
  end

  private

  def dogs_params
    params.permit(:breed)
  end
end
# rubocop:enable Style/Documentation
