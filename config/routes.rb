Rails.application.routes.draw do

  mount ActionCable.server => "/cable"

  root to: "home#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :quiz_sessions, only: [:show, :new, :update]
  resources :answers, only: [:show, :create]
  resources :openings, only: [:show, :create] do
    resources :application_submissions, only: [:new]
  end
  resources :application_submissions, only: [:create]

  get 'invitations/:invitation_id/quiz/session',
    to: 'quiz_sessions#new',
    as: :interview_session_initiation

  get 'quiz_sessions/:quiz_session_id/preview',
    to: 'quiz_session_preview#show',
    as: :quiz_session_preview

  get 'application-submission/:verdict',
    to: 'application_submission_verdicts#show',
    as: :application_submission_verdict,
    constraints: { vedict: /^(success|failure)$/ }

  get 'question-submissions/:id/preview',
    to: 'question_submission_preview#show',
    as: :question_submission_preview

  ActiveAdmin.routes(self)

end

# == Route Map
#
#                                     Prefix Verb       URI Pattern                                                 Controller#Action
#                                                       /cable                                                      #<ActionCable::Server::Base:0x007f95bba9e590 @mutex=#<Thread::Mutex:0x007f95bba9e568>, @pubsub=nil, @channel_classes=nil, @worker_pool=nil, @stream_event_loop=nil, @remote_connections=nil>
#                                       root GET        /                                                           home#index
#                     new_admin_user_session GET        /admin/login(.:format)                                      active_admin/devise/sessions#new
#                         admin_user_session POST       /admin/login(.:format)                                      active_admin/devise/sessions#create
#                 destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                     active_admin/devise/sessions#destroy
#                        admin_user_password POST       /admin/password(.:format)                                   active_admin/devise/passwords#create
#                    new_admin_user_password GET        /admin/password/new(.:format)                               active_admin/devise/passwords#new
#                   edit_admin_user_password GET        /admin/password/edit(.:format)                              active_admin/devise/passwords#edit
#                                            PATCH      /admin/password(.:format)                                   active_admin/devise/passwords#update
#                                            PUT        /admin/password(.:format)                                   active_admin/devise/passwords#update
#                              quiz_sessions GET        /quiz_sessions(.:format)                                    quiz_sessions#index
#                                            POST       /quiz_sessions(.:format)                                    quiz_sessions#create
#                           new_quiz_session GET        /quiz_sessions/new(.:format)                                quiz_sessions#new
#                          edit_quiz_session GET        /quiz_sessions/:id/edit(.:format)                           quiz_sessions#edit
#                               quiz_session GET        /quiz_sessions/:id(.:format)                                quiz_sessions#show
#                                            PATCH      /quiz_sessions/:id(.:format)                                quiz_sessions#update
#                                            PUT        /quiz_sessions/:id(.:format)                                quiz_sessions#update
#                                            DELETE     /quiz_sessions/:id(.:format)                                quiz_sessions#destroy
#                                    answers GET        /answers(.:format)                                          answers#index
#                                            POST       /answers(.:format)                                          answers#create
#                                 new_answer GET        /answers/new(.:format)                                      answers#new
#                                edit_answer GET        /answers/:id/edit(.:format)                                 answers#edit
#                                     answer GET        /answers/:id(.:format)                                      answers#show
#                                            PATCH      /answers/:id(.:format)                                      answers#update
#                                            PUT        /answers/:id(.:format)                                      answers#update
#                                            DELETE     /answers/:id(.:format)                                      answers#destroy
#         new_opening_application_submission GET        /openings/:opening_id/application_submissions/new(.:format) application_submissions#new
#                                   openings GET        /openings(.:format)                                         openings#index
#                                            POST       /openings(.:format)                                         openings#create
#                                new_opening GET        /openings/new(.:format)                                     openings#new
#                               edit_opening GET        /openings/:id/edit(.:format)                                openings#edit
#                                    opening GET        /openings/:id(.:format)                                     openings#show
#                                            PATCH      /openings/:id(.:format)                                     openings#update
#                                            PUT        /openings/:id(.:format)                                     openings#update
#                                            DELETE     /openings/:id(.:format)                                     openings#destroy
#                    application_submissions POST       /application_submissions(.:format)                          application_submissions#create
#               interview_session_initiation GET        /invitations/:invitation_id/quiz/session(.:format)          quiz_sessions#new
#             application_submission_verdict GET        /application-submission/:verdict(.:format)                  application_submission_verdicts#show
#                question_submission_preview GET        /question-submissions/:id/preview(.:format)                 question_submission_preview#show
#                                 admin_root GET        /admin(.:format)                                            admin/dashboard#index
#             batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                   admin/admin_users#batch_action
#                          admin_admin_users GET        /admin/admin_users(.:format)                                admin/admin_users#index
#                                            POST       /admin/admin_users(.:format)                                admin/admin_users#create
#                       new_admin_admin_user GET        /admin/admin_users/new(.:format)                            admin/admin_users#new
#                      edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                       admin/admin_users#edit
#                           admin_admin_user GET        /admin/admin_users/:id(.:format)                            admin/admin_users#show
#                                            PATCH      /admin/admin_users/:id(.:format)                            admin/admin_users#update
#                                            PUT        /admin/admin_users/:id(.:format)                            admin/admin_users#update
#                                            DELETE     /admin/admin_users/:id(.:format)                            admin/admin_users#destroy
#                 batch_action_admin_answers POST       /admin/answers/batch_action(.:format)                       admin/answers#batch_action
#                              admin_answers GET        /admin/answers(.:format)                                    admin/answers#index
#                                            POST       /admin/answers(.:format)                                    admin/answers#create
#                           new_admin_answer GET        /admin/answers/new(.:format)                                admin/answers#new
#                          edit_admin_answer GET        /admin/answers/:id/edit(.:format)                           admin/answers#edit
#                               admin_answer GET        /admin/answers/:id(.:format)                                admin/answers#show
#                                            PATCH      /admin/answers/:id(.:format)                                admin/answers#update
#                                            PUT        /admin/answers/:id(.:format)                                admin/answers#update
#                                            DELETE     /admin/answers/:id(.:format)                                admin/answers#destroy
#              batch_action_admin_applicants POST       /admin/applicants/batch_action(.:format)                    admin/applicants#batch_action
#                           admin_applicants GET        /admin/applicants(.:format)                                 admin/applicants#index
#                                            POST       /admin/applicants(.:format)                                 admin/applicants#create
#                        new_admin_applicant GET        /admin/applicants/new(.:format)                             admin/applicants#new
#                       edit_admin_applicant GET        /admin/applicants/:id/edit(.:format)                        admin/applicants#edit
#                            admin_applicant GET        /admin/applicants/:id(.:format)                             admin/applicants#show
#                                            PATCH      /admin/applicants/:id(.:format)                             admin/applicants#update
#                                            PUT        /admin/applicants/:id(.:format)                             admin/applicants#update
#                                            DELETE     /admin/applicants/:id(.:format)                             admin/applicants#destroy
# batch_action_admin_application_submissions POST       /admin/application_submissions/batch_action(.:format)       admin/application_submissions#batch_action
#              admin_application_submissions GET        /admin/application_submissions(.:format)                    admin/application_submissions#index
#                                            POST       /admin/application_submissions(.:format)                    admin/application_submissions#create
#           new_admin_application_submission GET        /admin/application_submissions/new(.:format)                admin/application_submissions#new
#          edit_admin_application_submission GET        /admin/application_submissions/:id/edit(.:format)           admin/application_submissions#edit
#               admin_application_submission GET        /admin/application_submissions/:id(.:format)                admin/application_submissions#show
#                                            PATCH      /admin/application_submissions/:id(.:format)                admin/application_submissions#update
#                                            PUT        /admin/application_submissions/:id(.:format)                admin/application_submissions#update
#                                            DELETE     /admin/application_submissions/:id(.:format)                admin/application_submissions#destroy
#                            admin_dashboard GET        /admin/dashboard(.:format)                                  admin/dashboard#index
#     dispatch_notification_admin_invitation GET        /admin/invitations/:id/dispatch_notification(.:format)      admin/invitations#dispatch_notification
#             batch_action_admin_invitations POST       /admin/invitations/batch_action(.:format)                   admin/invitations#batch_action
#                          admin_invitations GET        /admin/invitations(.:format)                                admin/invitations#index
#                                            POST       /admin/invitations(.:format)                                admin/invitations#create
#                       new_admin_invitation GET        /admin/invitations/new(.:format)                            admin/invitations#new
#                      edit_admin_invitation GET        /admin/invitations/:id/edit(.:format)                       admin/invitations#edit
#                           admin_invitation GET        /admin/invitations/:id(.:format)                            admin/invitations#show
#                                            PATCH      /admin/invitations/:id(.:format)                            admin/invitations#update
#                                            PUT        /admin/invitations/:id(.:format)                            admin/invitations#update
#                                            DELETE     /admin/invitations/:id(.:format)                            admin/invitations#destroy
#                batch_action_admin_openings POST       /admin/openings/batch_action(.:format)                      admin/openings#batch_action
#                             admin_openings GET        /admin/openings(.:format)                                   admin/openings#index
#                                            POST       /admin/openings(.:format)                                   admin/openings#create
#                          new_admin_opening GET        /admin/openings/new(.:format)                               admin/openings#new
#                         edit_admin_opening GET        /admin/openings/:id/edit(.:format)                          admin/openings#edit
#                              admin_opening GET        /admin/openings/:id(.:format)                               admin/openings#show
#                                            PATCH      /admin/openings/:id(.:format)                               admin/openings#update
#                                            PUT        /admin/openings/:id(.:format)                               admin/openings#update
#                                            DELETE     /admin/openings/:id(.:format)                               admin/openings#destroy
#                 admin_paper_trail_versions GET        /admin/paper_trail_versions(.:format)                       admin/paper_trail_versions#index
#                                            POST       /admin/paper_trail_versions(.:format)                       admin/paper_trail_versions#create
#              new_admin_paper_trail_version GET        /admin/paper_trail_versions/new(.:format)                   admin/paper_trail_versions#new
#             edit_admin_paper_trail_version GET        /admin/paper_trail_versions/:id/edit(.:format)              admin/paper_trail_versions#edit
#                  admin_paper_trail_version GET        /admin/paper_trail_versions/:id(.:format)                   admin/paper_trail_versions#show
#                                            PATCH      /admin/paper_trail_versions/:id(.:format)                   admin/paper_trail_versions#update
#                                            PUT        /admin/paper_trail_versions/:id(.:format)                   admin/paper_trail_versions#update
#                                            DELETE     /admin/paper_trail_versions/:id(.:format)                   admin/paper_trail_versions#destroy
#               batch_action_admin_questions POST       /admin/questions/batch_action(.:format)                     admin/questions#batch_action
#                            admin_questions GET        /admin/questions(.:format)                                  admin/questions#index
#                                            POST       /admin/questions(.:format)                                  admin/questions#create
#                         new_admin_question GET        /admin/questions/new(.:format)                              admin/questions#new
#                        edit_admin_question GET        /admin/questions/:id/edit(.:format)                         admin/questions#edit
#                             admin_question GET        /admin/questions/:id(.:format)                              admin/questions#show
#                                            PATCH      /admin/questions/:id(.:format)                              admin/questions#update
#                                            PUT        /admin/questions/:id(.:format)                              admin/questions#update
#                                            DELETE     /admin/questions/:id(.:format)                              admin/questions#destroy
#                remove_questions_admin_quiz DELETE     /admin/quizzes/:id/remove_questions(.:format)               admin/quizzes#remove_questions
#          associate_questions_admin_quizzes POST       /admin/quizzes/associate_questions(.:format)                admin/quizzes#associate_questions
#                 batch_action_admin_quizzes POST       /admin/quizzes/batch_action(.:format)                       admin/quizzes#batch_action
#                              admin_quizzes GET        /admin/quizzes(.:format)                                    admin/quizzes#index
#                                            POST       /admin/quizzes(.:format)                                    admin/quizzes#create
#                             new_admin_quiz GET        /admin/quizzes/new(.:format)                                admin/quizzes#new
#                            edit_admin_quiz GET        /admin/quizzes/:id/edit(.:format)                           admin/quizzes#edit
#                                 admin_quiz GET        /admin/quizzes/:id(.:format)                                admin/quizzes#show
#                                            PATCH      /admin/quizzes/:id(.:format)                                admin/quizzes#update
#                                            PUT        /admin/quizzes/:id(.:format)                                admin/quizzes#update
#                                            DELETE     /admin/quizzes/:id(.:format)                                admin/quizzes#destroy
#              admin_quiz_question_selection GET        /admin/quiz_question_selection(.:format)                    admin/quiz_question_selection#index
#                        admin_quiz_sessions GET        /admin/quiz_sessions(.:format)                              admin/quiz_sessions#index
#                                            POST       /admin/quiz_sessions(.:format)                              admin/quiz_sessions#create
#                     new_admin_quiz_session GET        /admin/quiz_sessions/new(.:format)                          admin/quiz_sessions#new
#                    edit_admin_quiz_session GET        /admin/quiz_sessions/:id/edit(.:format)                     admin/quiz_sessions#edit
#                         admin_quiz_session GET        /admin/quiz_sessions/:id(.:format)                          admin/quiz_sessions#show
#                                            PATCH      /admin/quiz_sessions/:id(.:format)                          admin/quiz_sessions#update
#                                            PUT        /admin/quiz_sessions/:id(.:format)                          admin/quiz_sessions#update
#                                            DELETE     /admin/quiz_sessions/:id(.:format)                          admin/quiz_sessions#destroy
#                batch_action_admin_settings POST       /admin/settings/batch_action(.:format)                      admin/settings#batch_action
#                             admin_settings GET        /admin/settings(.:format)                                   admin/settings#index
#                                            POST       /admin/settings(.:format)                                   admin/settings#create
#                          new_admin_setting GET        /admin/settings/new(.:format)                               admin/settings#new
#                         edit_admin_setting GET        /admin/settings/:id/edit(.:format)                          admin/settings#edit
#                              admin_setting GET        /admin/settings/:id(.:format)                               admin/settings#show
#                                            PATCH      /admin/settings/:id(.:format)                               admin/settings#update
#                                            PUT        /admin/settings/:id(.:format)                               admin/settings#update
#                                            DELETE     /admin/settings/:id(.:format)                               admin/settings#destroy
#                             admin_comments GET        /admin/comments(.:format)                                   admin/comments#index
#                                            POST       /admin/comments(.:format)                                   admin/comments#create
#                              admin_comment GET        /admin/comments/:id(.:format)                               admin/comments#show
#                                            DELETE     /admin/comments/:id(.:format)                               admin/comments#destroy
#
