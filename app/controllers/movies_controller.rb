class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @product.save
      flash[:notice] = 'Movie added!'
      redirect_to movie_path(@movie)
    else
      flash[:error] = 'Failed to add movie!'
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :post_url)
  end

end
