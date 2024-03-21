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

  private

  def album_params
    params.permit(:title, :on_vinyl, :number_of_tracks, :artist_id)
  end
end