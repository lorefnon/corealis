class OpeningsController < ApplicationController

  layout 'single_panel'

  def index
    @openings = Opening.order('id desc').page params[:page]
  end

end
