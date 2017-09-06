Rails.application.routes.draw do
  resources :people, :defaults => { :format => :json }
end
