class Servidor < ApplicationRecord
    has_many :assinatura, dependent: :destroy

    validates :nome, presence: true
end
