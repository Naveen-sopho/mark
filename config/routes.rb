Rails.application.routes.draw do
  get 'teacher/index'

  get 'student/index'

  get 'home/index'

  devise_for :students , path: 'students'
  devise_for :teachers, path:'teachers'
  resources :marks do 
    collection { post :import }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'marks#index'
end
