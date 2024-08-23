class AssinaturasController < ApplicationController
  before_action :set_assinatura, only: %i[show edit update destroy pagamento confirmar_pagamento]

  def index
    @q = Assinatura.ransack(params[:q])
    @assinaturas = @q.result.includes(:cliente, :servidor).order(params[:sort])
  end

  def show
  end

  def new
    @assinatura = Assinatura.new
  end

  def create
    @assinatura = Assinatura.new(assinatura_params)

    # Geração do número de registro sequencial
    @assinatura.numero_registro = generate_sequential_numero_registro

    # Adicionar a lógica para calcular a data de vencimento
    if @assinatura.data_inicio.present?
      @assinatura.data_vencimento = @assinatura.data_inicio + 30.days
    end

    if @assinatura.save
      redirect_to assinaturas_path, notice: 'Assinatura criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if assinatura_params[:data_inicio].present?
      @assinatura.data_vencimento = assinatura_params[:data_inicio].to_date + 30.days
    end

    if @assinatura.update(assinatura_params)
      redirect_to assinaturas_path, notice: 'Assinatura atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assinatura.destroy
    respond_to do |format|
      format.html { redirect_to assinaturas_path, notice: 'Assinatura excluída com sucesso.' }
      format.json { head :no_content }
    end
  end
  
  def pagamento
  end

  def confirmar_pagamento
    if @assinatura.present?
      nova_data_inicio = params[:data_inicio].present? ? params[:data_inicio].to_date : Date.today
      nova_data_vencimento = nova_data_inicio + 30.days

      # Criando uma nova assinatura com a nova data de início e vencimento
      nova_assinatura = Assinatura.new(cliente_id: @assinatura.cliente_id, 
                                       servidor_id: @assinatura.servidor_id, 
                                       data_inicio: nova_data_inicio, 
                                       data_vencimento: nova_data_vencimento,
                                       valor: @assinatura.valor,
                                       numero_registro: generate_sequential_numero_registro,
                                       observacoes: @assinatura.observacoes)

      if nova_assinatura.save
        redirect_to assinaturas_path, notice: 'Nova assinatura criada com sucesso após o pagamento.'
      else
        render :show, status: :unprocessable_entity
      end
    else
      redirect_to assinaturas_path, alert: 'Assinatura não encontrada.'
    end
  end

  private

  def set_assinatura
    @assinatura = Assinatura.find_by(id: params[:id])
  end

  def assinatura_params
    params.require(:assinatura).permit(:cliente_id, :servidor_id, :data_inicio, :data_vencimento, :valor, :observacoes, :numero_registro)
  end

  def generate_sequential_numero_registro
    last_numero = Assinatura.order(:numero_registro).last&.numero_registro.to_i
    new_numero = last_numero + 1
    new_numero.to_s.rjust(6, '0') # Formato 000001, 000002, etc.
  end
end
