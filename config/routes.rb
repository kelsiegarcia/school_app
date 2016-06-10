Rails.application.routes.draw do

  resources :schools do
    resources :courses
  end
end
