Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/admin/autocomplete_tags',
      to: 'application#autocomplete_tags',
      as: 'autocomplete_tags'

  get '/info', to: 'home#about'
  get '/tagged/:tag_name', as: :tagged, to: 'home#tagged'
  get '/:id', as: :album, to: 'home#album'
  root to: "home#index"
end
