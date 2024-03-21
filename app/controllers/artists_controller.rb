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

  def search
    @search_results = Artist.search(params[:search])
    render partial: 'search_results'
  end

  def create
    @artist = Artist.create(artist_params)

    redirect_to "/artists"
  end
  
  private

  def artist_params
    params.permit(:name, :still_recording, :number_of_singles)
  end

end