Rails.application.routes.draw do


  namespace 'api' do 
    resources :products 
    resources :categories
  end

 
  get "up" => "rails/health#show", as: :rails_health_check

end
