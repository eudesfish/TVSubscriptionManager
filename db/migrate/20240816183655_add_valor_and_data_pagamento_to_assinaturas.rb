class AddValorAndDataPagamentoToAssinaturas < ActiveRecord::Migration[7.1]
  def change
    add_column :assinaturas, :valor, :decimal
    add_column :assinaturas, :data_pagamento, :date
  end
end
