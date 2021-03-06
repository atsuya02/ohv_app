# frozen_string_literal: true

class SongPagesController < ApplicationController
  before_action :authenticate_admin!, only: %i[edit update destroy]

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    if @song.update(song_params)
      flash[:success] = t ".success"
      redirect_to cd_page_path(@song.cd_id)
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    flash[:success] = t ".success"
    redirect_to cd_page_path(@song.cd_id)
  end

  def song_params
    params.require(:song).permit(:name, :track_number)
  end
end
