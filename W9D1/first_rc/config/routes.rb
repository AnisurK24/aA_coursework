Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users

  
  get "users/new", to: "users#new", as: "new_user"
  
  get "users/:id/edit", to: "users#edit", as: "edit_user"
  
  get "/users", to: "users#index"

  get "/users/:id", to: "users#show", as: "user"
  
  post "/users", to: "users#create"

  put "/users/:id", to: "users#update"

  delete "/users/:id", to: "users#destroy"

  patch "/users/:id", to: "users#update"

  

end

#                    Prefix Verb   URI Pattern                                                                              Controller#Action
# ###                users GET    /users(.:format)                                                                         users#index
# ####                      POST   /users(.:format)                                                                         users#create
###                new_user GET    /users/new(.:format)                                                                     users#new
#  ########       edit_user GET    /users/:id/edit(.:format)                                                                users#edit
# ####                 user GET    /users/:id(.:format)                                                                     users#show
#  ###                      PATCH  /users/:id(.:format)                                                                     users#update
#  #####                    PUT    /users/:id(.:format)                                                                     users#update
#   #####                   DELETE /users/:id(.:format)                                                                     users#destroy
# ###    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
##rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show #######
####     rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
##update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#####  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create


#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                     users GET    /users(.:format)                                                                         users#index
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           POST   /users(.:format)                                                                         users#create
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                           PATCH  /users/:id(.:format)                                                                     users#update
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create