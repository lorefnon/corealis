ActiveAdmin.register_page "quiz_question_selection" do

  menu false

  content title: "Select Questions for Quiz" do
    render partial: 'admin/quizzes/quiz_question_selection'
  end
end
