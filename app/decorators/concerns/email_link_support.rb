module EmailLinkSupport
  def email_link
    "<a href='mailto:#{email}' target='_top'>#{email}</a>".html_safe
  end
end
