class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to song_path(@song)
  end

  def update

  end

  def edit
    @artist = Artist.find(params[:artist_id])
    byebug
    @song = @artist.song.find(params)
  end

  def show
  end

  def destroy
  end

  private
  def song_params
    params.require(:song).permit(:title)
  end
end
