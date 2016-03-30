module ConstraintViolationSupport
  extend ActiveSupport::Concern

  def constraint_violation?(error, constraint_name)
    error.message =~ %r[violates unique constraint "#{constraint_name}"]
  end

end
