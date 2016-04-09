module Features
  module RouteHelpers

    def current_route
      Rails.application.routes.recognize_path(current_path)
    end

  end
end
