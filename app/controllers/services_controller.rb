class ServicesController < ApplicationController
  def index
    @services = Services.all
  end

  def show
    @service = Services.find(params[:id])
  end
end


