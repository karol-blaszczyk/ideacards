Ideacards::Application.routes.draw do

authenticated :user do
  namespace :admin do
    resources :ideas, path: 'pomysly'
    resources :categories, path: 'categorie'
    resources :users
  end
end

end