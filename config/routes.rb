Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pdf_templates#index'
  get '/index', to: 'pdf_templates#index'
  get '/show', to: 'pdf_templates#show'
  get '/generate_with_pdfkit', to: 'pdf_templates#pdfkit_generate'
  get '/generate_with_prawn', to: 'pdf_templates#prawn_generate'
  get '/generate_with_wicked', to: 'pdf_templates#wicked_generate'
end
