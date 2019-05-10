Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  match '*a', :to => 'errors#routing', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# Now we override the devise provided registrations controller to respond it to json