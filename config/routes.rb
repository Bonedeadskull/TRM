Rails.application.routes.draw do
  get "/.well-known/acme-challenge/-WUcG85sUnDqFh4EPueeGN52b35zwTB675y_QxXTL3Y" => "pages#letsencrypt"
  get "/.well-known/acme-challenge/l69cgQnebT68BcWlSii-k3alIcmwMgqvEOz4pRZ3kXI" => "pages#letsencryptwww"
  get "/user_notes/:id" => "pages#usernotes"
  get "/user_last_seen/:id" => "pages#userlastseen"
  devise_for :trainers, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "admin/dashboard#index"
end
