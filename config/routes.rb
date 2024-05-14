# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dogs#index'
  post :fetch_breed_image, to: 'dogs#fetch_breed_image'
end
