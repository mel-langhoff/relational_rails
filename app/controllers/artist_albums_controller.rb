class ArtistAlbumsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums
  end

  def new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @album = @artist.albums.new(album_params)
    
    if @album.save
      redirect_to artist_albums_path(@artist)
    else
      flash[:alert] = "Error: #{error_message(@artist.errors)}"
      redirect_to artist_albums_path(@artist)
    end
  end

  def sort
    @artist = Artist.find(params[:artist_id])
    @albums = @artist.albums.alphabetical_order

    render partial: 'sort'
  end

  def threshold_filter
    @artist = Artist.find(params[:id])
    @albums_by_threshold_filter = Album.filter_by_threshold(params[:threshold])
    render partial: 'threshold_filter'
  end

  private

  def album_params
    params.permit(:title, :on_vinyl, :number_of_tracks, :artist_id)
  end
end