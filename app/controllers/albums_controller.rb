class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def search
    @search_results = Album.search(params[:search])
    render partial: 'search_results'
  end
  
  def edit
    @album = Album.find(params[:id])    
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to "/albums/#{@album.id}"
    else
      redirect_to edit_album_path(@album)
      flash[:alert] = "Error: #{error_message.(@album.errors)}"
    end
  end

  private
  
  def album_params
    params.permit(:title, :on_vinyl, :number_of_tracks)
  end
end