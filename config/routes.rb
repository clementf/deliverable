Deliverable::Engine.routes.draw do
  namespace :webhooks do
    resources :sendgrid_events, only: [:create]
  end
end
