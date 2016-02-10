ActiveAdmin.register Answer do

  permit_params *(@resource.column_names)

  form do |f|
    inputs "Question" do
    if f.object.persisted?
      input :canonical
    else
      input :canonical, as: :hidden, input_html: { value: params[:canonical] }
      input :question_id, as: :hidden, input_html: { value: params[:question_id] }
    end
    input :details
    actions
  end
  end

end

# == Schema Information
#
# Table name: answers
#
#  id              :integer          not null, primary key
#  question_id     :integer
#  details         :text
#  answerer_id     :integer
#  answerer_type   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  canonical       :boolean
#  quiz_session_id :integer
#
