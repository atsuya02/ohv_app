# frozen_string_literal: true

class CdPagesController < ApplicationController
  def index
    @cds = Cd.recently_released_at
  end

  def show
    @cd = Cd.find_by(id: params[:id])
    @songs = @cd.songs.recording_order
  end
end
