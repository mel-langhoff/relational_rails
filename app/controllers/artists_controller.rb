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

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to "/artists"
    else
      redirect_to "/artists/#{@artist.id}/edit"
      flash[:alert] = "Error: #{error_message.(@artist.errors)}"
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.albums.destroy_all
    artist.destroy

    redirect_to artists_path
  end

  def sort_by_album_number
    @artist = Artist.find(params[:id])
    @sorted_albums = @artist.album.sort_by_album_number

    render partial: 'sort_by_album_number'
  end
  
  private

  def artist_params
    params.permit(:name, :still_recording, :number_of_singles)
  end

end