Rails.application.routes.draw do
  get 'show/view1'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :profiles
      resources :crystals
      resources :relationships
    end
  end
end
