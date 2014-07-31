Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  namespace :api , path: '/', constraints: { subdomain: 'api' } do
    resources :locations
  end

end
