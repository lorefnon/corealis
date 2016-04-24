ActiveAdmin.register Invitation do

  menu priority: 5
  permit_params :invitor_id, :status, :valid_from, :valid_till, :duration, :quiz_id, :invitee_id,
                invitee_attributes: [:name, :username, :email, :phone_number, :creator_id]

  scope :active

  decorate_with InvitationDecorator

  filter :status,
         collection: -> { Invitation.statuses },
         as: :check_boxes
  filter :invitor_email_eq, label: 'Invitor Email'
  filter :invitee_email_eq, label: 'Invitee Email'
  filter :invitee_experience_eq, label: 'Invitee Experience'
  filter :invitee_phone_number_eq, label: 'Invitee Phone Number'

  controller do

    after_build :associate_invitee
    after_build :associate_invitor

    private

    def associate_invitee(resource)
      return unless params[:action] == 'new'
      if params[:invitee_id]
        resource.invitee_id = params[:invitee_id]
      else
        resource.build_invitee(creator: current_admin_user)
      end
    end

    def associate_invitor(resource)
      return unless params[:action] == 'new'
      return if resource.persisted?
      resource.invitor ||= current_admin_user
    end

  end

  show do
    attributes_table do
      row :id
      row :invitor
      row :invitee do |invitation|
        if invitee = invitation.invitee
          link_to invitee.name, admin_applicant_path(invitee)
        end
      end
      row :quiz_id
      row :valid_from
      row :valid_till
      row :duration
    end

    panel "Applicant" do
      attributes_table_for invitation.invitee.decorate do
        row :id
        row :email do |it|
          it.email_link
        end
        row :experience do |it|
          it.humanized_experience
        end
      end
    end

    render 'admin/versions'
  end

  form do |f|
    invitation = f.object
    unless invitation.invitee.persisted?
      f.inputs "Add New Applicant" do
        f.semantic_fields_for :invitee do |f|
          f.input :creator_id, as: :hidden
          f.input :name
          f.input :email
          f.input :phone_number
        end
        div link_to "Select Existing Applicant", admin_applicants_path
      end
    end

    f.inputs "Add invitation for applicant" do

      f.semantic_errors

      if invitation.invitee.persisted?
        li do
          f.input :invitee_id, as: :hidden
        end
      end

      if f.object.persisted?

        li do
          label 'Invitor'
          if invitor = invitation.invitor
            div "User could not be found"
          else
            link_to invitor.name, admin_admin_user_path(invitor)
          end
        end

        li do
          label 'Quiz'
          div do
            link_to f.object.quiz.title, admin_quiz_path(f.object.quiz)
          end
        end

        f.input :status, as: :select, collection: Invitation.statuses.keys
      else
        f.input :invitor_id, as: :hidden, input_html: { value: current_admin_user.id }
      end

      f.input :quiz
      f.input :status, as: :select, collection: Invitation.statuses.keys
      f.input :valid_from
      f.input :valid_till
      f.input :duration

      f.submit

    end
  end

  member_action :dispatch_notification do
    resource.dispatch_notification
    flash[:success] = 'Invitation has been resent to the applicant.'
    redirect_to action: :show
  end

  action_item :dispatch_notification, only: :show do
    link_to 'Resend Notification', dispatch_notification_admin_invitation_path
  end

  action_item :preview_quiz_session, only: :show do
    if quiz_session = resource.quiz_session
      link_to 'Preview Session', quiz_session_preview_path(quiz_session)
    end
  end

end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer          not null
#  invitee_id :integer          not null
#  quiz_id    :integer          not null
#  status     :integer          default("pending")
#  valid_from :datetime
#  valid_till :datetime
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  token      :string
#
# Indexes
#
#  index_invitations_on_id_and_status                     (id,status)
#  index_invitations_on_id_and_valid_from_and_valid_till  (id,valid_from,valid_till)
#  index_invitations_on_quiz_id                           (quiz_id)
#
