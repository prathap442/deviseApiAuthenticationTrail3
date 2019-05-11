Rails.application.routes.draw do
  namespace :api, format: :json do
    namespace :v1, format: :json do
      devise_scope :user do
        post 'users' => 'registrations#create'
      end
    end
  end
  devise_for :users, controllers: { registrations: 'api/v1/registrations' },format: :json
  resources :registrations
  match '*a', :to => 'errors#routing', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Now we override the devise provided registrations controller to respond it to json