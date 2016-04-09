class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def index
  end
end
