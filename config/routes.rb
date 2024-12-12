
Rails.application.routes.draw do
  resources :image_forms
  root "image_forms#index"
end
