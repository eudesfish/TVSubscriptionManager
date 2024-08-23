class Assinatura < ApplicationRecord
  belongs_to :cliente
  belongs_to :servidor

  before_save :set_status
  before_validation :generate_unique_registro_numero, on: :create
  before_create :set_numero_registro
  
  validates :numero_registro, presence: true, uniqueness: true
  validates :cliente_id, :servidor_id, :data_inicio, :data_vencimento, :valor, presence: true

  before_save :atualizar_data_vencimento, if: :data_inicio_changed?

  def set_status
    if self.data_vencimento < Date.today
      self.status = 'Vencido'
    elsif self.data_vencimento <= 3.days.from_now
      self.status = 'À vencer'
    else
      self.status = 'Pago'
    end
  end

  def promessa_de_pagamento(dias)
    self.data_vencimento += dias.days
    self.save
  end

  def atualizar_data_vencimento
    self.data_vencimento = self.data_inicio + 30.days
  end

  private
  def set_numero_registro
    last_record = Assinatura.order(:numero_registro).last
    self.numero_registro = last_record ? last_record.numero_registro.to_i + 1 : 1
    self.numero_registro = self.numero_registro.to_s.rjust(6, '0') # Formata como 000001, 000002, etc.
  end

  def generate_unique_registro_numero
    if self.numero_registro.blank?
      ultimo_registro = Assinatura.order(:created_at).last
      self.numero_registro = if ultimo_registro.present?
                               ultimo_registro.numero_registro.to_i.next.to_s.rjust(6, '0')
                             else
                               '000001'
                             end
    end
  end
  def assign_numero_registro
    self.numero_registro ||= generate_unique_registro_numero
  end
  # Lista de atributos permitidos para pesquisa e ordenação com Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[
      numero_registro
      data_inicio
      data_vencimento
      valor
      status
      created_at
      updated_at
      cliente_id
      servidor_id
    ]
  end

  # Lista de associações permitidas para pesquisa e ordenação com Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      cliente
      servidor
    ]
  end
end

