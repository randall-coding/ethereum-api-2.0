Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'transaction#index'
  get '/' => 'transaction#index', as: :ethereum
  post '' => 'transaction#index'
end
