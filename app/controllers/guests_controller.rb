class GuestsController < ApplicationController
  def index
    @guests = Guests.all
  end

  def show
    @guest = Guests.find(params[:id])
  end
end
