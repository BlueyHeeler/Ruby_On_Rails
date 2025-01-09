class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1 or /movies/1.json
  def show
    @user = User.find_by(id: session[:user_id]) # Verifica se há um usuário logado
    @movie = Movie.find(params[:id])
  end

  # GET /movies/new
  def new
    @user = User.find_by(id: session[:user_id])
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    @user = User.find_by(id: session[:user_id]) # Verifica se há um usuário logado
  end

  # POST /movies or /movies.json
  def create
    # Permite um array de filmes
    movie_params = params.permit(movies: [:name, :release_date, :rating, :description, :poster_image])

    # Cria uma lista de instâncias de Movie a partir dos parâmetros
    movies = movie_params[:movies].map do |movie_param|
      movie = Movie.new(movie_param)
      movie.user_id = session[:user_id] # Associa o filme ao usuário logado
      movie
    end

    # Tenta salvar todos os filmes
    if movies.all?(&:save)
      redirect_to home_homepage_path, notice: 'Movies were successfully created.'
    else
      # Se algum filme falhar na validação, re-renderiza a página
      @movie = movies.first # Pega o primeiro filme para exibir erros, se necessário
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to home_homepage_path, status: :see_other, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.expect(movie: [ :name, :release_date, :rating, :description, :user_id, :poster_image])
  end
end
