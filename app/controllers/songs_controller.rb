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
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to @song
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @song = @artist.song.find(params[:id])
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:title)
  end
end
