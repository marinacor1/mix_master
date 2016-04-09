class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def new
    @artist = Artist.find(params[:artist_id]) #we need to find the artist
    @song = @artist.songs.new #create the song
  end

  def create
    @artist = Artist.find(params[:artist_id]) #error here
    @song = @artist.songs.create(song_params)
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to @song
  end

  def edit
    #params = {"controller"=>"songs", "action"=>"edit", "id"=>"179"}
    @song = Song.find(params[:id]) #error here
    # @song = @song.artist #worked with rick on this one
  end

  def show
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
