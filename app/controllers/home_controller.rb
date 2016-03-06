class HomeController < ApplicationController

  before_action :redirect_to_home_url, only: :index

  private

  def redirect_to_home_url
    if home_url = Setting['organization.home_url']
      redirect_to home_url
    end
  end

end
