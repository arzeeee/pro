Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user/menus#welcome'
  
  mount ActionCable.server, at: '/cable'
  get :chatroom, to: "chatrooms#index"
  post :message, to: "messages#create"
  
  scope module: :user do
    resource :profile, except: [:destroy]
    get :mainmenu, to: "menus#mainmenu"
    scope module: :details do
      get :majors
      get :schools
      get :grades
      get :verification
    end
  end
  
  scope module: :auth do
    delete :logout, to: 'sessions#destroy'
    get :sign_up, to: 'users#new'
    post :sign_up, to: 'users#create'
    get :login, to: 'sessions#new'
    post :login, to: 'sessions#create'
  end
  
  scope module: :menu do
    resources :eduvideos, :problemsets, :consultations, param: :subject  do
      member do
        resource :chapter, path: '/:chapter' do
          member do
            resource :title, path: '/:title'
          end
        end
      end
    end
    
    resource :tryouts, only: :show  do
      member do
        resource :type, path: '/:type'
      end
    end
    
    resources :lessonoutlines, :path => 'outline', param: :subject do
      member do
        resource :chapter, path: '/:chapter' do
          member do
            resource :title, path: '/:title'
          end
        end
      end
    end
  end
  
  scope module: :helper do
    scope module: :utilities do
      get :name
      get :sms_verification, to:  "utilities#sms_send"
      post :sms_verification, to: "utilities#sms_generate"
    end
  end
  
  
  

  
end