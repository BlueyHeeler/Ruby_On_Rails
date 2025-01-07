class User < ApplicationRecord
    has_many :movies, dependent: :destroy

    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :user_type, presence: true, inclusion: { in: %w[admin regular] } # Exemplo de tipos de usuário
end
