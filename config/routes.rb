Rails.application.routes.draw do

    # questions, advertisements, and posts are handled with resourceful routing.  
  
    resources :questions
  
    resources :advertisements
  
    resources :topics do
    # #34
        resources :posts, except: [:index]
    end
  
    get 'about' => 'welcome#about'  
  
    get 'contact' => 'welcome#contact' 
  
    get 'faq' => 'welcome#/faq'
  
    root 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
