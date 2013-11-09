Ideacards::Application.routes.draw do
   root :to => 'home#index'

   devise_for :users, :path_names => { :sign_in => 'zaloguj', :sign_out => 'wyloguj', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'zarejestruj', :sign_up => 'cmon_let_me_in' }

   resources :ideas, only: [:index, :show], path: 'pomysly' do
      get :search, on: :collection, path: 'szukaj'
      post :search, on: :collection, path: 'szukaj'
   end


end
