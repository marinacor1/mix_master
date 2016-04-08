class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:aritst_id])
    @song = @artist.songs.new 
  end
end
