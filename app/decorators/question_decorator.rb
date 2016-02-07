class QuestionDecorator < Draper::Decorator

  include MarkdownRenderingSupport

  delegate_all

  def rendered_description
    markdown_to_html_renderer.render(description)
  end

end
