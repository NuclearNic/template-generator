Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pdf_templates#index'
  get '/index', to: 'pdf_templates#index'
  get '/show', to: 'pdf_templates#show'
  get '/generate', to: 'pdf_templates#generate'
end
