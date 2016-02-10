ActiveAdmin.register_page "quiz_question_selection" do

  menu false

  content title: "Select Questions for Quiz" do

    panel "Select a quiz" do

      quizzes = Quiz.all

      if quizzes.any?
        table_for Quiz.all do
          column do |it|
            radio_button_tag "quiz", it.id
          end
          column :id
          column :title
        end
      else
        span "No Quizzes current exist"
      end

      hr
      span do
        binding.pry
        link_to "Create a quiz", new_admin_quiz_path(question_id: params[:question_id])
      end

    end

    panel "Select Questions to be Added" do
      selected_questions = Question.where(id: params[:question_id]).all
      table_for selected_questions do
        column do |it|
          check_box_tag "question[#{it.id}]", it.id, true
        end
        column :id
        column :title
      end
    end

  end
end
