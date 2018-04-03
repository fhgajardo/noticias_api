Rails.application.routes.draw do

  
  defaults format: :json do
  	resources :noticia
    
    
  end
  #resources :comentarios
  #post 'noticias/comentar' , to: 'noticia#comentar'
  #get 'noticias/admin', to: 'noticia#admin'
  get 'news', to: 'noticia#index'
  post 'news', to: 'noticia#create'
  get 'news/:id', to: 'noticia#show'
  delete 'news/:id', to: 'noticia#destroy'
  get 'news/:id/comments', to: 'noticia#mostrar_comentarios'
  get 'news/:id/comments/:c_id', to: 'noticia#mostrar_comentario'
  post 'news/:id/comments', to: 'noticia#comentar'
  delete 'news/:id/comments/:c_id', to: 'noticia#eliminar_comentario'
  #root 'noticia#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
