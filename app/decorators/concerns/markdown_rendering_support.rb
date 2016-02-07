module MarkdownRenderingSupport

  extend ActiveSupport::Concern
  extend Memoist

  def markdown_to_html_renderer
    @markdown_to_html_renderer ||= Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      autolink: true,
      tables: true
    )
  end

  alias_method :renderer, :markdown_to_html_renderer

end
