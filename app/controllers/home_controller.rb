class HomeController < ApplicationController
    before_action :authenticate_user!, only: [:homepage]
    def login
    end

    def loginError
    end

    def authenticate
        user = User.find_by(name: params[:name])

        if user && user.password == params[:password]
            # Armazena o ID do usuário na sessão
            session[:user_id] = user.id
            redirect_to home_homepage_path, notice: "Login realizado com sucesso!"
        else
            # Credenciais inválidas
            flash.now[:alert] = "Nome ou senha inválidos. Tente novamente."
            redirect_to home_loginError_path
        end
    end

    def homepage
        @user = User.find_by(id: session[:user_id]) # Verifica se há um usuário logado
        if @user
            @movies = @user.movies.includes(:poster_image_attachment) # Inclui Active Storage para evitar consultas extras
        end
    end
end
