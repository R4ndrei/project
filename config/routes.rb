Rails.application.routes.draw do
  resources :boards do
    resources :columns do
      member do
        patch :move
      end
      resources :stories do
        member do
          patch :move
        end
      end
    end
  end
end