class ArtistAlbumsController < ApplicationController
  def index
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
  end
end