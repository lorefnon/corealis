class HomeController < ApplicationController

  before_action :load_openings, only: :index

  def load_openings
    @openings = Opening.current.showcased
  end

end
