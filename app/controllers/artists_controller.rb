class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.most_recently_created
  end

  def show
    @artist = Artist.find(params[:id])
    @albums = @artist.albums
    @albums_count = @artist.album_count
  end

  def new
    
  end

end