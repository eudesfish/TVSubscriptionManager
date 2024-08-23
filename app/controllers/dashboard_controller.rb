class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @clientes_count = Cliente.count
    @clientes_vencimento = Cliente.joins(:assinaturas)
                                  .where('assinaturas.data_vencimento <= ?', 3.days.from_now)
                                  .distinct
    @clientes_vencimento_count = @clientes_vencimento.count
  end
end

