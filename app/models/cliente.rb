class Cliente < ApplicationRecord
    has_many :assinaturas, dependent: :destroy

    validates :nome, :telefone, presence: true
end
