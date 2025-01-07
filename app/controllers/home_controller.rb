class HomeController < ApplicationController
    before_action :authenticate_user!, only: [:homepage]
    def login
        # Aqui você pode inicializar variáveis, se necessário
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
            render :login
        end
    end

    def homepage
        @user = User.find(session[:user_id]) if session[:user_id]
    end
end
