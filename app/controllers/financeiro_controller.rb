class FinanceiroController < ApplicationController
    def index
      # Recupera todos os pagamentos agrupados por mês e soma os valores
      @pagamentos_por_mes = Assinatura.group_by_month(:data_inicio, format: "%B %Y").sum(:valor)
  
      # Verifica se há um filtro de mês aplicado
      if params[:mes].present?
        mes_selecionado = Date.strptime(params[:mes], "%Y-%m")
        @pagamentos_filtrados = Assinatura.where(data_inicio: mes_selecionado.all_month)
      else
        @pagamentos_filtrados = Assinatura.none
      end
    end
  end
  