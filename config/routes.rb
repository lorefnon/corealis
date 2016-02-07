Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

end

# == Route Map
#
#                         Prefix Verb       URI Pattern                               Controller#Action
#                                           /__OPAL_SOURCE_MAPS__                     #<Opal::SourceMapServer:70122373428380>
#                      opal_spec GET        /opal_spec(.:format)                      opal_spec#run
#                           root GET        /                                         home#index
#               new_user_session GET        /users/sign_in(.:format)                  devise/sessions#new
#                   user_session POST       /users/sign_in(.:format)                  devise/sessions#create
#           destroy_user_session DELETE     /users/sign_out(.:format)                 devise/sessions#destroy
#                  user_password POST       /users/password(.:format)                 devise/passwords#create
#              new_user_password GET        /users/password/new(.:format)             devise/passwords#new
#             edit_user_password GET        /users/password/edit(.:format)            devise/passwords#edit
#                                PATCH      /users/password(.:format)                 devise/passwords#update
#                                PUT        /users/password(.:format)                 devise/passwords#update
#       cancel_user_registration GET        /users/cancel(.:format)                   devise/registrations#cancel
#              user_registration POST       /users(.:format)                          devise/registrations#create
#          new_user_registration GET        /users/sign_up(.:format)                  devise/registrations#new
#         edit_user_registration GET        /users/edit(.:format)                     devise/registrations#edit
#                                PATCH      /users(.:format)                          devise/registrations#update
#                                PUT        /users(.:format)                          devise/registrations#update
#                                DELETE     /users(.:format)                          devise/registrations#destroy
#         new_admin_user_session GET        /admin/login(.:format)                    active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                    active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                   active_admin/devise/sessions#destroy
#            admin_user_password POST       /admin/password(.:format)                 active_admin/devise/passwords#create
#        new_admin_user_password GET        /admin/password/new(.:format)             active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)            active_admin/devise/passwords#edit
#                                PATCH      /admin/password(.:format)                 active_admin/devise/passwords#update
#                                PUT        /admin/password(.:format)                 active_admin/devise/passwords#update
#                     admin_root GET        /admin(.:format)                          admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format) admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)              admin/admin_users#index
#                                POST       /admin/admin_users(.:format)              admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)          admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)     admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)          admin/admin_users#show
#                                PATCH      /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                PUT        /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)          admin/admin_users#destroy
#     batch_action_admin_answers POST       /admin/answers/batch_action(.:format)     admin/answers#batch_action
#                  admin_answers GET        /admin/answers(.:format)                  admin/answers#index
#                                POST       /admin/answers(.:format)                  admin/answers#create
#               new_admin_answer GET        /admin/answers/new(.:format)              admin/answers#new
#              edit_admin_answer GET        /admin/answers/:id/edit(.:format)         admin/answers#edit
#                   admin_answer GET        /admin/answers/:id(.:format)              admin/answers#show
#                                PATCH      /admin/answers/:id(.:format)              admin/answers#update
#                                PUT        /admin/answers/:id(.:format)              admin/answers#update
#                                DELETE     /admin/answers/:id(.:format)              admin/answers#destroy
#                admin_dashboard GET        /admin/dashboard(.:format)                admin/dashboard#index
# batch_action_admin_invitations POST       /admin/invitations/batch_action(.:format) admin/invitations#batch_action
#              admin_invitations GET        /admin/invitations(.:format)              admin/invitations#index
#                                POST       /admin/invitations(.:format)              admin/invitations#create
#           new_admin_invitation GET        /admin/invitations/new(.:format)          admin/invitations#new
#          edit_admin_invitation GET        /admin/invitations/:id/edit(.:format)     admin/invitations#edit
#               admin_invitation GET        /admin/invitations/:id(.:format)          admin/invitations#show
#                                PATCH      /admin/invitations/:id(.:format)          admin/invitations#update
#                                PUT        /admin/invitations/:id(.:format)          admin/invitations#update
#                                DELETE     /admin/invitations/:id(.:format)          admin/invitations#destroy
#   batch_action_admin_questions POST       /admin/questions/batch_action(.:format)   admin/questions#batch_action
#                admin_questions GET        /admin/questions(.:format)                admin/questions#index
#                                POST       /admin/questions(.:format)                admin/questions#create
#             new_admin_question GET        /admin/questions/new(.:format)            admin/questions#new
#            edit_admin_question GET        /admin/questions/:id/edit(.:format)       admin/questions#edit
#                 admin_question GET        /admin/questions/:id(.:format)            admin/questions#show
#                                PATCH      /admin/questions/:id(.:format)            admin/questions#update
#                                PUT        /admin/questions/:id(.:format)            admin/questions#update
#                                DELETE     /admin/questions/:id(.:format)            admin/questions#destroy
#     batch_action_admin_quizzes POST       /admin/quizzes/batch_action(.:format)     admin/quizzes#batch_action
#                  admin_quizzes GET        /admin/quizzes(.:format)                  admin/quizzes#index
#                                POST       /admin/quizzes(.:format)                  admin/quizzes#create
#                 new_admin_quiz GET        /admin/quizzes/new(.:format)              admin/quizzes#new
#                edit_admin_quiz GET        /admin/quizzes/:id/edit(.:format)         admin/quizzes#edit
#                     admin_quiz GET        /admin/quizzes/:id(.:format)              admin/quizzes#show
#                                PATCH      /admin/quizzes/:id(.:format)              admin/quizzes#update
#                                PUT        /admin/quizzes/:id(.:format)              admin/quizzes#update
#                                DELETE     /admin/quizzes/:id(.:format)              admin/quizzes#destroy
#                 admin_comments GET        /admin/comments(.:format)                 admin/comments#index
#                                POST       /admin/comments(.:format)                 admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)             admin/comments#show
#                                DELETE     /admin/comments/:id(.:format)             admin/comments#destroy
#
