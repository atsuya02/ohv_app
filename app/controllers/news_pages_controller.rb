class NewsPagesController < ApplicationController
  def index
    @informations = Information.recently_announced_at.all
  end

  def show
    @information = Information.find_by(id: params[:id])
  end
end
