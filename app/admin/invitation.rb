ActiveAdmin.register Invitation do

  menu priority: 5
  permit_params :invitor_id, :status, :valid_from, :valid_till, :duration, :quiz_id, :invitee_id, invitee_attributes: []
  decorate_with InvitationDecorator

  controller do

    # before_action :ensure_applicant_id, only: [:new]
    #
    # def ensure_applicant_id
    #   if applicant_id = params[:applicant_id]
    #     @applicant = Applicant.find applicant_id
    #   else
    #     redirect_to admin_applicants_path, flash: { info: 'Please select an applicant' }
    #   end
    # end

    after_build :associate_invitee
    after_build :associate_invitor

    private

    def associate_invitee(resource)
      return if resource.persisted?
      resource.invitee ||=
        if params[:applicant_id]
          Applicant.find(params[:applicant_id])
        else
          Applicant.new
        end
    end

    def associate_invitor(resource)
      reutrn if resource.persisted?
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
          f.input :name
          f.input :username
          f.input :email
          f.input :phone_number
        end

        div link_to "Select Existing Applicant", admin_applicants_path
      end
    end

    f.inputs "Add invitation for applicant" do

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
end

# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  invitor_id :integer          not null
#  invitee_id :integer          not null
#  quiz_id    :integer          not null
#  status     :integer          default(0)
#  valid_from :datetime
#  valid_till :datetime
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_invitations_on_id_and_status                     (id,status)
#  index_invitations_on_id_and_valid_from_and_valid_till  (id,valid_from,valid_till)
#  index_invitations_on_quiz_id                           (quiz_id)
#
