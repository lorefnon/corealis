ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Active Invitations" do
          invitations = Invitation.active.includes(:quiz)
          if invitations.length == 0
            div class: "blank_slate_container" do
              span class: "blank_slate" do
                "There are no active invitations"
              end
            end
          else
            ul do
              Invitation.active.includes(:quiz).each do |invitation|
                li link_to(invitation.quiz.title, admin_invitation_path(invitation))
              end
            end
          end
        end
      end

      column do
        panel "Recent Quiz Sessions" do
          sessions = QuizSession.recent.includes(:quiz)
          if sessions.length == 0
            div class: 'blank_slate_container' do
              span class: "blank_slate" do
                "There were no recent quiz sessions"
              end
            end
          else
            ul do
              sessions.each do |session|
                li link_to(session.quiz.title, admin_quiz_session_path(session))
              end
            end
          end
        end
      end
    end

  end # content
end
