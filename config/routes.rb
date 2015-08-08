Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/admin/autocomplete_tags',
      to: 'application#autocomplete_tags',
      as: 'autocomplete_tags'
  
  get '/about', to: 'home#about'
  get '/:id', as: :album, to: 'home#album'
  root to: "home#index"
end
