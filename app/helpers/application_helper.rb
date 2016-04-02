module ApplicationHelper

  def bs_alert_class(name)
    {
      'error' => 'alert-danger',
      'success' => 'alert-success'
    }[name] || 'alert-info'
  end

end
