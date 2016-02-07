ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Upcoming Interviews" do
          ul do
            Invitation.upcoming.includes(:quiz).map do |invitation|
              li link_to(invitation.quiz.title, admin_invitation_path(invitation))
            end
          end
        end
      end

      column do
        panel "Recent Interview Sessions" do
          ul do
            QuizSession.recent.includes(:quiz).map do |session|
              li link_to(session.quiz.title, admin_quiz_session_path(session))
            end
          end
        end
      end
    end

  end # content
end
