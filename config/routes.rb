Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :images, except: [:new, :edit, :create, :update, :destroy, :show]
    end
  end
end
