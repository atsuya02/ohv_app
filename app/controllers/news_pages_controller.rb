class NewsPagesController < ApplicationController
  def index
    @informations = Information.recent.all
  end

  def show
    @information = Information.find_by(id: params[:id])
  end
end
