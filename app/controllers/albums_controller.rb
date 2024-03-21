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
  
end