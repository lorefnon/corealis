class MarkdownInput < Formtastic::Inputs::TextInput
  def hint_text
    'Supports <a href="https://guides.github.com/features/mastering-markdown/">Github flavored markdown</a>'.html_safe
  end
end
