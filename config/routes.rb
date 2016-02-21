Rails.application.routes.draw do

  root to: "home#index"

  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'invitations/:invitation_id/quiz/session', to: 'quiz_sessions#new'

  ActiveAdmin.routes(self)

end

# == Route Map
#
# "/Users/lorefnon/Workspace/corealis/spec-opal"
#                                  Prefix Verb       URI Pattern                                        Controller#Action
#                                                    /__OPAL_SOURCE_MAPS__                              #<Opal::SourceMapServer:70336027029260>
#                                                    /spec-opal                                         <Opal::RSpec::Rails::Server debug=true use_index=true public_root=>
#                                    root GET        /                                                  home#index
#                  new_admin_user_session GET        /admin/login(.:format)                             active_admin/devise/sessions#new
#                      admin_user_session POST       /admin/login(.:format)                             active_admin/devise/sessions#create
#              destroy_admin_user_session DELETE|GET /admin/logout(.:format)                            active_admin/devise/sessions#destroy
#                     admin_user_password POST       /admin/password(.:format)                          active_admin/devise/passwords#create
#                 new_admin_user_password GET        /admin/password/new(.:format)                      active_admin/devise/passwords#new
#                edit_admin_user_password GET        /admin/password/edit(.:format)                     active_admin/devise/passwords#edit
#                                         PATCH      /admin/password(.:format)                          active_admin/devise/passwords#update
#                                         PUT        /admin/password(.:format)                          active_admin/devise/passwords#update
#                                         GET        /invitations/:invitation_id/quiz/session(.:format) quiz_sessions#new
#                              admin_root GET        /admin(.:format)                                   admin/dashboard#index
#          batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)          admin/admin_users#batch_action
#                       admin_admin_users GET        /admin/admin_users(.:format)                       admin/admin_users#index
#                                         POST       /admin/admin_users(.:format)                       admin/admin_users#create
#                    new_admin_admin_user GET        /admin/admin_users/new(.:format)                   admin/admin_users#new
#                   edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)              admin/admin_users#edit
#                        admin_admin_user GET        /admin/admin_users/:id(.:format)                   admin/admin_users#show
#                                         PATCH      /admin/admin_users/:id(.:format)                   admin/admin_users#update
#                                         PUT        /admin/admin_users/:id(.:format)                   admin/admin_users#update
#                                         DELETE     /admin/admin_users/:id(.:format)                   admin/admin_users#destroy
#              batch_action_admin_answers POST       /admin/answers/batch_action(.:format)              admin/answers#batch_action
#                           admin_answers GET        /admin/answers(.:format)                           admin/answers#index
#                                         POST       /admin/answers(.:format)                           admin/answers#create
#                        new_admin_answer GET        /admin/answers/new(.:format)                       admin/answers#new
#                       edit_admin_answer GET        /admin/answers/:id/edit(.:format)                  admin/answers#edit
#                            admin_answer GET        /admin/answers/:id(.:format)                       admin/answers#show
#                                         PATCH      /admin/answers/:id(.:format)                       admin/answers#update
#                                         PUT        /admin/answers/:id(.:format)                       admin/answers#update
#                                         DELETE     /admin/answers/:id(.:format)                       admin/answers#destroy
#           batch_action_admin_applicants POST       /admin/applicants/batch_action(.:format)           admin/applicants#batch_action
#                        admin_applicants GET        /admin/applicants(.:format)                        admin/applicants#index
#                                         POST       /admin/applicants(.:format)                        admin/applicants#create
#                     new_admin_applicant GET        /admin/applicants/new(.:format)                    admin/applicants#new
#                    edit_admin_applicant GET        /admin/applicants/:id/edit(.:format)               admin/applicants#edit
#                         admin_applicant GET        /admin/applicants/:id(.:format)                    admin/applicants#show
#                                         PATCH      /admin/applicants/:id(.:format)                    admin/applicants#update
#                                         PUT        /admin/applicants/:id(.:format)                    admin/applicants#update
#                                         DELETE     /admin/applicants/:id(.:format)                    admin/applicants#destroy
#                         admin_dashboard GET        /admin/dashboard(.:format)                         admin/dashboard#index
#          batch_action_admin_invitations POST       /admin/invitations/batch_action(.:format)          admin/invitations#batch_action
#                       admin_invitations GET        /admin/invitations(.:format)                       admin/invitations#index
#                                         POST       /admin/invitations(.:format)                       admin/invitations#create
#                    new_admin_invitation GET        /admin/invitations/new(.:format)                   admin/invitations#new
#                   edit_admin_invitation GET        /admin/invitations/:id/edit(.:format)              admin/invitations#edit
#                        admin_invitation GET        /admin/invitations/:id(.:format)                   admin/invitations#show
#                                         PATCH      /admin/invitations/:id(.:format)                   admin/invitations#update
#                                         PUT        /admin/invitations/:id(.:format)                   admin/invitations#update
#                                         DELETE     /admin/invitations/:id(.:format)                   admin/invitations#destroy
# batch_action_admin_paper_trail_versions POST       /admin/paper_trail_versions/batch_action(.:format) admin/paper_trail_versions#batch_action
#              admin_paper_trail_versions GET        /admin/paper_trail_versions(.:format)              admin/paper_trail_versions#index
#                                         POST       /admin/paper_trail_versions(.:format)              admin/paper_trail_versions#create
#           new_admin_paper_trail_version GET        /admin/paper_trail_versions/new(.:format)          admin/paper_trail_versions#new
#          edit_admin_paper_trail_version GET        /admin/paper_trail_versions/:id/edit(.:format)     admin/paper_trail_versions#edit
#               admin_paper_trail_version GET        /admin/paper_trail_versions/:id(.:format)          admin/paper_trail_versions#show
#                                         PATCH      /admin/paper_trail_versions/:id(.:format)          admin/paper_trail_versions#update
#                                         PUT        /admin/paper_trail_versions/:id(.:format)          admin/paper_trail_versions#update
#                                         DELETE     /admin/paper_trail_versions/:id(.:format)          admin/paper_trail_versions#destroy
#            batch_action_admin_questions POST       /admin/questions/batch_action(.:format)            admin/questions#batch_action
#                         admin_questions GET        /admin/questions(.:format)                         admin/questions#index
#                                         POST       /admin/questions(.:format)                         admin/questions#create
#                      new_admin_question GET        /admin/questions/new(.:format)                     admin/questions#new
#                     edit_admin_question GET        /admin/questions/:id/edit(.:format)                admin/questions#edit
#                          admin_question GET        /admin/questions/:id(.:format)                     admin/questions#show
#                                         PATCH      /admin/questions/:id(.:format)                     admin/questions#update
#                                         PUT        /admin/questions/:id(.:format)                     admin/questions#update
#                                         DELETE     /admin/questions/:id(.:format)                     admin/questions#destroy
#             remove_questions_admin_quiz DELETE     /admin/quizzes/:id/remove_questions(.:format)      admin/quizzes#remove_questions
#       associate_questions_admin_quizzes POST       /admin/quizzes/associate_questions(.:format)       admin/quizzes#associate_questions
#              batch_action_admin_quizzes POST       /admin/quizzes/batch_action(.:format)              admin/quizzes#batch_action
#                           admin_quizzes GET        /admin/quizzes(.:format)                           admin/quizzes#index
#                                         POST       /admin/quizzes(.:format)                           admin/quizzes#create
#                          new_admin_quiz GET        /admin/quizzes/new(.:format)                       admin/quizzes#new
#                         edit_admin_quiz GET        /admin/quizzes/:id/edit(.:format)                  admin/quizzes#edit
#                              admin_quiz GET        /admin/quizzes/:id(.:format)                       admin/quizzes#show
#                                         PATCH      /admin/quizzes/:id(.:format)                       admin/quizzes#update
#                                         PUT        /admin/quizzes/:id(.:format)                       admin/quizzes#update
#                                         DELETE     /admin/quizzes/:id(.:format)                       admin/quizzes#destroy
#           admin_quiz_question_selection GET        /admin/quiz_question_selection(.:format)           admin/quiz_question_selection#index
#                          admin_comments GET        /admin/comments(.:format)                          admin/comments#index
#                                         POST       /admin/comments(.:format)                          admin/comments#create
#                           admin_comment GET        /admin/comments/:id(.:format)                      admin/comments#show
#                                         DELETE     /admin/comments/:id(.:format)                      admin/comments#destroy
#                                    page GET        /pages/*id                                         high_voltage/pages#show
#
