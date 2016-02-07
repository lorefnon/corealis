ActiveAdmin.register Quiz do

  permit_params *(@resource.column_names), question_ids: []

  form do |f|
    inputs 'Quiz' do
      input :title
      input :duration
      input :questions
      render 'admin/creator_form_entry', form: f
      actions
    end
  end

end

# == Schema Information
#
# Table name: quizzes
#
#  id         :integer          not null, primary key
#  title      :string
#  creator_id :integer
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
