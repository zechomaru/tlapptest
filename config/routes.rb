Rails.application.routes.draw do


  root 'home#index'

  mount Ckeditor::Engine => '/ckeditor'

  get 'service/:url' => 'pages#show'
  get 'admin', to: redirect('/administraccion/login')
  get 'freelance', to: redirect('/freelance/login')
  get 'login', to: redirect('/usuario/iniciar_sesion')

  resources :forms, :form_answers, :pages

  devise_for :admins, path: 'administraccion', path_names: {sign_in: 'login', sign_out: 'cerrar_session'}, :skip =>[:registrations], controllers: {
    sessions: 'admins/sessions'
  }
  
  devise_for :users, path: 'usuario', path_names: {sign_in: 'iniciar_sesion', sign_up: 'registrate'}, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :freelances, path: 'freelance', path_names: {sign_in: 'login'}, :skip =>[:registrations], controllers: {
    sessions: 'freelances/sessions'
  }


  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :roles, :f_roles, :services, :pages, :deliveries, :admins, :freelances, :form_builds, :form_questions
    scope '/service' do
      resources :categories, :bundles
    end
  end

  namespace :freelance do
    get 'dashboard' => 'dashboard#index'
  end
 
end
