class PlaylistsController < ApplicationController
  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end

  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :edit
    end
  end

  def destroy
    playlist = Playlist.find(params[:id])
    playlist.destroy
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, song_ids: [])
  end

end
