Rails.application.routes.draw do

  get 'sponsored_posts/show'

  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

    # questions, advertisements, and posts are handled with resourceful routing.  
  
    resources :questions
  
    resources :advertisements
  
    resources :topics do
        resources :posts, except: [:index]
        resources :sponsored_posts, except: [:index]
    end
    
    # #7
    resources :users, only: [:new, :create]
  
    get 'about' => 'welcome#about'  
  
    get 'contact' => 'welcome#contact' 
  
    get 'faq' => 'welcome#/faq'
  
    root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
