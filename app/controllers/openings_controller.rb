class OpeningsController < ApplicationController

  layout 'single_panel'

  def index
    @openings = Opening.order('id desc').page params[:page]
  end

  def show
    @opening = Opening.find params[:id]
  end

end
