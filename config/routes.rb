Rails.application.routes.draw do
  post 'urls', to: 'url_records#create'
  get 'urls/:id', to: 'url_records#show', as: :url_record
  get 'urls/:id/stats', to: 'url_records#stats'
end
